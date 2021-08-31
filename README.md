# Royal design documentation site

## Setup

`git clone git@github.com:Royal-Design-Group/royal-documentation-site.git`
### Installing Dependencies on Linux

Install Ruby, NodeJS, and tools for compiling native ruby gems:

**On Ubuntu 18.04+**

```bash
sudo apt install ruby ruby-dev build-essential libffi-dev zlib1g-dev liblzma-dev nodejs patch
```

**On Fedora 31+**

```bash
sudo dnf install @development-tools redhat-rpm-config ruby ruby-devel libffi-devel zlib-devel xz-devel patch nodejs
```


Then, update RubyGems and install bundler:

```bash
sudo gem update --system
sudo gem install bundler
```

### Installing Dependencies on macOS

First, install [homebrew](https://brew.sh/), then install xcode command line tools:

```bash
xcode-select --install
```

Agree to the Xcode license:

```bash
sudo xcodebuild -license
```

Install nodejs runtime:

```bash
brew install node
```

Update RubyGems and install bundler:

```bash
gem update --system
gem install bundler
```

3. `cd royal-documentation-site`
4. Install ruby gems for slate:

```shell
# either run this to run locally
bundle install
```

To add new documentation, it needs to be in the markdow format (filename.md)
when you are satisfied with your documentation add the new page here to the folder `includes/` 

-> `royal-documentation-site/source/includes/`

After that, declare the new page in `source/index.html.md` under the section `includes:` 
Where you place the page in the declaration, it will be added to the documentation site

```YML
includes:
  - README.md
  - meta-tags.md
  - verify-deploys.md
  - sites-and-services.md
  - doc-in-swedish.md
  - collector-test-data.md 
  # <--- HÄR
```

When it's done, you should test by building the site locally:

To do so, follow these steps:

```bash
./slate.sh build && ./slate.sh serve
```

Then you should see the site with the new changes on the http://localhost:4567

if you are satisfied with your changes push the new code to github

then run

```bash
./deploy.sh
```
to deploy the new documentation on the gh-pages site


if you want to know something specific about this project or its structure, you can find most of it in [Slates README ](./_README.md)