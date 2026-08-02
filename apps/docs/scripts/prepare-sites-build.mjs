import { cp, mkdir, readdir, writeFile } from "node:fs/promises";
import { join } from "node:path";

const outputDirectory = new URL("../dist/", import.meta.url);
const clientDirectory = new URL("../dist/client/", import.meta.url);
const serverDirectory = new URL("../dist/server/", import.meta.url);

await mkdir(clientDirectory, { recursive: true });
await mkdir(serverDirectory, { recursive: true });

const entries = await readdir(outputDirectory, { withFileTypes: true });
for (const entry of entries) {
  if (["client", "server", ".openai"].includes(entry.name)) continue;
  await cp(
    join(outputDirectory.pathname, entry.name),
    join(clientDirectory.pathname, entry.name),
    { recursive: true },
  );
}

const worker = `const worker = {
  async fetch(request, env) {
    if (!env.ASSETS) {
      return new Response("Static assets binding unavailable", { status: 503 });
    }

    const response = await env.ASSETS.fetch(request);
    if (response.status !== 404 || request.method !== "GET") return response;

    const url = new URL(request.url);
    if (url.pathname.includes(".")) return response;

    return env.ASSETS.fetch(new Request(new URL("/index.html", url), request));
  },
};

export default worker;
`;

await writeFile(new URL("index.js", serverDirectory), worker);
