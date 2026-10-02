# Guidelines

## About me

- Software engineer, non-native English speaker. I write commit messages, PRs,
  docs, code comments, and chat. Not papers or fiction.

## General

- Use clear, plain English.
- Cut text that adds no information: praise, preamble, recap of what was just said.
- No emoji, em dashes, or inflated words ("leverage", "robust", "seamless").
- Start each prose sentence on a new source line, prefer wrapping after punctuation, and preserve existing formatting.

## Git

- Never run `git push` (unless allowed).
- Never commit to the default branch (unless allowed).
- Use short sentences in commit messages.
- Avoid punctuation in the commit message subject, except for `:` and `!`.
- Wrap code identifiers in backticks in commit messages.
- Wrap code blocks in commit messages with triple backticks.

## GitHub

- Use `gh` for GitHub interactions.
- Run `actionlint` after editing GitHub Actions workflow files (if it is installed).

## Ruby

- Run `ruby -wc` after editing Ruby files.
- Use `ri` to look into Ruby classes or methods when working with Ruby.
