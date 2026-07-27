import { defineConfig } from "astro/config";

const githubRepository = process.env.GITHUB_REPOSITORY;
const [githubOwner, githubRepo] = githubRepository?.split("/") ?? [];
const isGitHubPages = process.env.DEPLOY_TARGET === "github-pages";
const isUserSite =
  githubOwner &&
  githubRepo?.toLowerCase() === `${githubOwner.toLowerCase()}.github.io`;

export default defineConfig({
  output: "static",
  site: isGitHubPages
    ? `https://${githubOwner.toLowerCase()}.github.io`
    : "https://design.arrels.local",
  base: isGitHubPages && !isUserSite ? `/${githubRepo}` : "/",
});
