# Guidelines

## About me

- Software engineer, non-native English speaker. I write commit messages, PRs, docs, code comments, and chat. Not papers or fiction.

## General

- Use clear, plain English.
- Cut text that adds no information: praise, preamble, recap of what was just said.
- No emoji, em dashes, or inflated words ("leverage", "robust", "seamless").
- Prefer bullet points over long paragraphs.
- Keep one sentence per line, as much as possible.
- Avoid lines longer than 200 characters, and preserve headings, lists, and code blocks.

## Testing

- Use test doubles only for external boundaries (network, time, filesystem), or when a real object is impractical.

## Git

- Do not push, unless the user asks.
- Do not commit on the default branch unless the user asks. Otherwise, create a branch first.
- Do not rewrite history that is already pushed.
- Do not end a commit subject with a period.
- Prefer short sentences in a commit message body.
- Wrap code identifiers in backticks in commit messages.
- Wrap code blocks in commit messages with triple backticks.

## GitHub

- Use `gh` for GitHub interactions.
- Run `actionlint` after editing GitHub Actions workflow files (if it is installed).

## Ruby

- Run `ruby -wc` after editing Ruby files.
- Use `ri` to look into Ruby classes or methods when working with Ruby.

## Shell

- Prefer Homebrew's Bash when installed.
- Run `shellcheck` after editing shell files.
