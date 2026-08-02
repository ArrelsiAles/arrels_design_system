import { readFile, writeFile } from "node:fs/promises";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const repositoryRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const tokenDirectory = resolve(repositoryRoot, "packages/tokens/src");
const flutterTokenDirectory = resolve(
  repositoryRoot,
  "packages/flutter/lib/src/tokens",
);
const checkOnly = process.argv.includes("--check");

const readJson = async (name) =>
  JSON.parse(await readFile(resolve(tokenDirectory, name), "utf8"));

const primitives = await readJson("primitives.tokens.json");
const semanticLight = await readJson("semantic-light.tokens.json");
const semanticDark = await readJson("semantic-dark.tokens.json");
const components = await readJson("components.tokens.json");

function collectTokenPaths(node, prefix = "", paths = new Set()) {
  if (!node || typeof node !== "object") return paths;
  if (Object.hasOwn(node, "$value")) paths.add(prefix);
  for (const [key, value] of Object.entries(node)) {
    if (!key.startsWith("$")) {
      collectTokenPaths(value, prefix ? `${prefix}.${key}` : key, paths);
    }
  }
  return paths;
}

function collectAliases(node, aliases = []) {
  if (typeof node === "string") {
    const match = node.match(/^\{(.+)\}$/);
    if (match) aliases.push(match[1]);
  } else if (node && typeof node === "object") {
    for (const value of Object.values(node)) collectAliases(value, aliases);
  }
  return aliases;
}

const primitivePaths = collectTokenPaths(primitives);
for (const [name, semantic] of [
  ["semantic-light.tokens.json", semanticLight],
  ["semantic-dark.tokens.json", semanticDark],
]) {
  const missingSemantic = collectAliases(semantic).filter(
    (alias) => !primitivePaths.has(alias),
  );
  const semanticPaths = collectTokenPaths(semantic);
  const availablePaths = new Set([...primitivePaths, ...semanticPaths]);
  const missingComponents = collectAliases(components).filter(
    (alias) => !availablePaths.has(alias),
  );
  const missing = [...new Set([...missingSemantic, ...missingComponents])];
  if (missing.length) {
    throw new Error(`${name} has unresolved aliases: ${missing.join(", ")}`);
  }
}

const generatedHeader = `// GENERATED FROM packages/tokens/src. DO NOT EDIT MANUALLY.\n`;

function dartName(group, token) {
  return `${group}${token[0].toUpperCase()}${token.slice(1)}`;
}

function generateColors() {
  const lines = [
    generatedHeader.trimEnd(),
    "import 'package:flutter/widgets.dart';",
    "",
    "/// Raw palette generated from the technology-neutral token source.",
    "/// Screens and components must consume semantic [ArrelsColors] instead.",
    "abstract final class ArrelsPrimitiveColors {",
  ];
  for (const [group, tokens] of Object.entries(primitives.color)) {
    if (group.startsWith("$")) continue;
    for (const [token, definition] of Object.entries(tokens)) {
      const hex = definition.$extensions?.["org.arrels.hex"];
      if (!hex) throw new Error(`Missing org.arrels.hex for color.${group}.${token}`);
      lines.push(
        `  static const ${dartName(group, token)} = Color(0xFF${hex.slice(1).toUpperCase()});`,
      );
    }
    lines.push("");
  }
  lines.push("  const ArrelsPrimitiveColors._();", "}", "");
  return lines.join("\n");
}

function dimensionValue(group, token) {
  const value = primitives.dimension[group][token].$value;
  if (value.unit !== "px") throw new Error(`Unsupported unit for dimension.${group}.${token}`);
  return Number(value.value).toFixed(1);
}

function generateDimensions() {
  const sections = [
    ["ArrelsSpacing", "4pt spacing scale.", "space", null, "space"],
    ["ArrelsRadius", "Corner radius scale.", "radius", null, ""],
    ["ArrelsControlSize", "Interactive control height scale.", "control", null, ""],
    ["ArrelsIconSize", "Icon size scale.", "icon", null, ""],
    ["ArrelsBorderWidth", "Border width scale.", "border", { default: "regular" }, ""],
    ["ArrelsBreakpoint", "Responsive breakpoints in logical pixels.", "breakpoint", null, ""],
  ];
  const lines = [generatedHeader.trimEnd()];
  for (const [className, description, group, aliases, prefix] of sections) {
    lines.push(`/// ${description}`, `abstract final class ${className} {`);
    for (const token of Object.keys(primitives.dimension[group])) {
      const dartToken = aliases?.[token] ?? `${prefix}${token}`;
      lines.push(`  static const ${dartToken} = ${dimensionValue(group, token)};`);
    }
    lines.push("", `  const ${className}._();`, "}", "");
  }
  return lines.join("\n");
}

function generateMotion() {
  const lines = [
    generatedHeader.trimEnd(),
    "import 'package:flutter/animation.dart';",
    "",
    "/// Motion durations and easings generated from the neutral token source.",
    "abstract final class ArrelsMotion {",
  ];
  for (const [name, definition] of Object.entries(primitives.motion.duration)) {
    if (name.startsWith("$")) continue;
    const value = definition.$value;
    if (value.unit !== "ms") throw new Error(`Unsupported duration unit for ${name}`);
    lines.push(`  static const ${name} = Duration(milliseconds: ${value.value});`);
  }
  lines.push("");
  for (const [name, definition] of Object.entries(primitives.motion.easing)) {
    if (name.startsWith("$")) continue;
    const [a, b, c, d] = definition.$value;
    lines.push(`  static const ${name}Curve = Cubic(${a}, ${b}, ${c}, ${d});`);
  }
  lines.push("", "  const ArrelsMotion._();", "}", "");
  return lines.join("\n");
}

const outputs = new Map([
  ["arrels_primitive_colors.dart", generateColors()],
  ["arrels_spacing.dart", generateDimensions()],
  ["arrels_motion.dart", generateMotion()],
]);

let hasMismatch = false;
for (const [name, content] of outputs) {
  const path = resolve(flutterTokenDirectory, name);
  if (checkOnly) {
    const existing = await readFile(path, "utf8");
    if (existing !== content) {
      console.error(`${name} is out of sync. Run npm run generate.`);
      hasMismatch = true;
    }
  } else {
    await writeFile(path, content);
    console.log(`Generated ${name}`);
  }
}

if (hasMismatch) process.exitCode = 1;
else if (checkOnly) console.log("Token aliases and Flutter outputs are in sync.");
