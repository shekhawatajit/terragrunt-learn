include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_path_to_repo_root()}/_envcommon/tf-backend.hcl"
  expose = true
}

terraform {
  source = "${include.env.locals.source_url}?ref=${include.env.locals.module_version}"
}

