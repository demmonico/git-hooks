# Git hooks collection

Use for automation code review process and cleaning code process.
Forked from [this](https://github.com/demmonico/bash) repository.


## Includes

 - PSR-2 **pre-commit** hook
 - Commit message **pre-commit** hook (should use only for *issue*-oriented commit naming convention)
 - Moodle project's clear cache **post-merge** hook


## Install

To use these hooks you should:
 - install `phpcs`
 - add all or selected git hooks from `hooks/` folder to your `[REPO_PATH]/.git/hooks/` folder
 

#### Auto-pull git hooks

You could pull git hooks automatically using your `composer.json` file:
 - download `pull_git_hooks.sh` script and put it to your `[REPO_PATH]` dir
 - add following snippet to your `composer.json` file at the `scripts/post-install-cmd` section and listed hooks by comma (`pre-commit` and `commit-msg` as example):
```json
 "scripts": {
         ...
         "post-install-cmd": [
             "bash pull_git_hooks.sh pre-commit commit-msg"
         ]
 },
```
 - run `composer install` - git hooks will be downloaded automatically from this repo 


#### Manual pulling git hook

For downloading single file run:

```sh
wget -O post-merge https://raw.githubusercontent.com/demmonico/git-hooks/master/hooks/post-merge && chmod +x post-merge
```

 
## Usage

If you successfully add hooks to your repository then then will automatically applied by Git service.