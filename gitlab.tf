provider "gitlab" {
  token = var.gitlab_token
}

resource "gitlab_group" "blue-bean-games" {
  name = "Blue Bean Games"
  path = "blue-bean-games"
}

data "gitlab_user" "grayson" {
  username = "grayherm"
}

resource "gitlab_group_membership" "grayson" {
  group_id     = gitlab_group.blue-bean-games.id
  user_id      = data.gitlab_user.grayson.id
  access_level = "developer"
}

data "gitlab_user" "toby" {
  username = "tobuss"
}

resource "gitlab_group_membership" "toby" {
  group_id     = gitlab_group.blue-bean-games.id
  user_id      = data.gitlab_user.toby.id
  access_level = "developer"
}

data "gitlab_user" "yasser" {
  username = "yasserhcn"
}

resource "gitlab_group_membership" "yasser" {
  group_id     = gitlab_group.blue-bean-games.id
  user_id      = data.gitlab_user.yasser.id
  access_level = "developer"
}

resource "gitlab_project" "terraform" {
  name             = "Terraform"
  path             = "terraform"
  description      = "Our cloud infrastructure, managed by Terraform. -- https://terraform.io"
  namespace_id     = gitlab_group.blue-bean-games.id
  visibility_level = "public"

  issues_enabled             = true
  merge_requests_enabled     = true
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = false
  packages_enabled           = false
  pipelines_enabled          = false
}

resource "gitlab_project_mirror" "terraform-to-github" {
  project             = gitlab_project.terraform.id
  url                 = "https://${var.github_mirror_token}@github.com/Blue-Bean-Games/terraform"
  enabled             = true
  keep_divergent_refs = false
}

resource "gitlab_project_approval_rule" "terraform-1" {
  project            = gitlab_project.terraform.id
  name               = "terraform-1"
  approvals_required = 1
}

resource "gitlab_project" "bluebean-dot-games" {
  name             = "bluebean.games"
  path             = "bluebean.games"
  description      = "Our website! :O  -- https://bluebean.games"
  namespace_id     = gitlab_group.blue-bean-games.id
  visibility_level = "public"

  issues_enabled             = true
  merge_requests_enabled     = true
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = false
  packages_enabled           = false
  pipelines_enabled          = false
}

resource "gitlab_project_mirror" "bluebean-dot-games-to-github" {
  project             = gitlab_project.bluebean-dot-games.id
  url                 = "https://${var.github_mirror_token}@github.com/Blue-Bean-Games/bluebean.games"
  enabled             = true
  keep_divergent_refs = false
}

resource "gitlab_project_approval_rule" "bluebean-dot-games-1" {
  project            = gitlab_project.bluebean-dot-games.id
  name               = "bluebean-dot-games-1"
  approvals_required = 1
}

resource "gitlab_project" "Unnamed-Horror-Game" {
  name             = "Perturbed"
  path             = "perturbed"
  description      = "Episodic collection of interactive horror stories."
  namespace_id     = gitlab_group.blue-bean-games.id
  visibility_level = "public"

  issues_enabled             = true
  merge_requests_enabled     = true
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = false
  packages_enabled           = false
  pipelines_enabled          = true
}

resource "gitlab_project_mirror" "Unnamed-Horror-Game-to-github" {
  project             = gitlab_project.Unnamed-Horror-Game.id
  url                 = "https://${var.github_mirror_token}@github.com/Blue-Bean-Games/Unnamed-Horror-Game"
  enabled             = true
  keep_divergent_refs = false
}

resource "gitlab_project_approval_rule" "Unnamed-Horror-Game-1" {
  project            = gitlab_project.Unnamed-Horror-Game.id
  name               = "Unnamed-Horror-Game-1"
  approvals_required = 1
}

resource "gitlab_project" "social-media" {
  name             = "Social Media"
  path             = "social-media"
  description      = "A place for our long-term social media stuff."
  namespace_id     = gitlab_group.blue-bean-games.id
  visibility_level = "public"

  issues_enabled             = true
  merge_requests_enabled     = true
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = false
  packages_enabled           = false
  pipelines_enabled          = false
}

resource "gitlab_project_mirror" "social-media-to-github" {
  project             = gitlab_project.social-media.id
  url                 = "https://${var.github_mirror_token}@github.com/Blue-Bean-Games/social-media"
  enabled             = true
  keep_divergent_refs = false
}

resource "gitlab_project_approval_rule" "social-media-1" {
  project            = gitlab_project.social-media.id
  name               = "social-media-1"
  approvals_required = 1
}

resource "gitlab_project" "Blue-Bean-Bot" {
  name             = "Blue Bean Bot"
  path             = "blue-bean-bot"
  description      = "A bot for our Discord!"
  namespace_id     = gitlab_group.blue-bean-games.id
  visibility_level = "public"

  issues_enabled             = true
  merge_requests_enabled     = true
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = true
  packages_enabled           = false
  pipelines_enabled          = true
}

resource "gitlab_project_mirror" "Blue-Bean-Bot-to-github" {
  project             = gitlab_project.Blue-Bean-Bot.id
  url                 = "https://${var.github_mirror_token}@github.com/Blue-Bean-Games/Blue-Bean-Bot"
  enabled             = true
  keep_divergent_refs = false
}

resource "gitlab_project_approval_rule" "Blue-Bean-Bot-1" {
  project            = gitlab_project.Blue-Bean-Bot.id
  name               = "Blue-Bean-Bot-1"
  approvals_required = 1
}

resource "gitlab_project" "Blue-Bean-Games" {
  name             = "Blue Bean Games"
  path             = "blue-bean-games"
  description      = "A monorepo containing anything not big or specific enough to be its own project."
  namespace_id     = gitlab_group.blue-bean-games.id
  visibility_level = "public"

  issues_enabled             = true
  merge_requests_enabled     = true
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = false
  packages_enabled           = false
  pipelines_enabled          = false
}

resource "gitlab_project_mirror" "Blue-Bean-Games-to-github" {
  project             = gitlab_project.Blue-Bean-Games.id
  url                 = "https://${var.github_mirror_token}@github.com/Blue-Bean-Games/blue-bean-games"
  enabled             = true
  keep_divergent_refs = false
}

resource "gitlab_project_approval_rule" "Blue-Bean-Games-1" {
  project            = gitlab_project.Blue-Bean-Games.id
  name               = "Blue-Bean-Games-1"
  approvals_required = 1
}

resource "gitlab_project" "dot-github" {
  name             = "dot-github"
  path             = "dot-github"
  description      = "Root repo for our GitHub organisation -- https://github.com/Blue-Bean-Games"
  namespace_id     = gitlab_group.blue-bean-games.id
  visibility_level = "public"

  issues_enabled             = false
  merge_requests_enabled     = false
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = false
  packages_enabled           = false
  pipelines_enabled          = false
}

resource "gitlab_project_mirror" "dot-github-to-github" {
  project             = gitlab_project.dot-github.id
  url                 = "https://${var.github_mirror_token}@github.com/Blue-Bean-Games/.github"
  enabled             = true
  keep_divergent_refs = false
}

resource "gitlab_project_approval_rule" "dot-github-1" {
  project            = gitlab_project.dot-github.id
  name               = "dot-github-1"
  approvals_required = 1
}
