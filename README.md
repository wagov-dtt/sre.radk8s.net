# Training (technical)

This repo builds a technical documentation site aimed at reducing cost/effort to run a security focused [Internal Developer Platform](https://internaldeveloperplatform.org) with a small team.

## Contributing

The [devcontainer](.devcontainer/devcontainer.json) is a basic Debian image and the site is built with [Zola](https://www.getzola.org). Quickstart below.

```bash
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Install zola
brew install zola
# Serve site
zola serve
# Build site
zola build
```

