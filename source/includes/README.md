# Royal web

This package contains the main code for the Royal Design website/React app. It is based on [Create React App](https://github.com/facebookincubator/create-react-app) but is using a custom fork of the `react-scripts` package, found in this monorepo.

## projects
[Github](https://github.com/Royal-Design-Group/royal-web)
[Bitbucket](https://bitbucket.org/grebban/royal-web/src/develop/)
## Setup

Make sure you have [yarn](https://yarnpkg.com/en/docs/install) installed.

Open a terminal and install dependencies:

```shell
yarn
```

Change into the royaldesign package folder:

```shell
cd packages/royaldesign
```

Run development server:

```shell
yarn start
```

Build production client and server bundle:

```shell
yarn build
```

Run production server:

```shell
yarn serve
```

### Build with a specific locale

By default the build is using the default locale specified in config.json of the royaldesign package root. To override this, set the env-var LOCALE when building for production:

```shell
LOCALE=en-US yarn build
```

## Translation flow

If you have added new strings to an application you can extract the strings to the default locale file (sv-SE) using this command:

```shell
yarn translations extract
```

If you look at you git diff you should be able to identify any new strings that have been added to the application.

To get them translated we use a Google Drive document to communicate translations with Royal Design. We input the id (the key generated to JSON file, like ange_rabattkod_fa2f75f7) and the swedish string and they will make sure that their resources for translations will fill the rest of the columns. We then manually just add the translations to the other locale files after we have received the translations. If you have a large amount of strings there is an old script somewhere that Niclas Vänström can dig up.

So add any new strings to the sheet for the application and ping Isabelle Blanc in the Royal Design Slack about the fact that we need translations.

[Link to the google spreadsheets](https://docs.google.com/spreadsheets/d/1XjzXfH6_d8k9AXVua-9GpHpwDxtzk6Mah8r7Zb5tjAY/)

## Adding a new site

When adding a new site there are some steps that you need to go through:

- If you are adding a new currency. Add the format to src/constants/format.js
- Configure routing in src/lib/routing/config.js
- Add locale to src/config.json
- Create a translated locale file (preferably based on sv-SE if possible) and add it to translations/{new_locale}.json
- Create new env files in the env folder in the root

## CI/CD

There are currently some basic build and release pipelines for the royal-web repository. So whenever you push to a release branch a build based on the file Dockerfile-VSTS will be triggered, if the build is successful it will be automatically deployed to the staging environment which consists of these sites:

https://royalweb-no-stage.azurewebsites.net
https://royalweb-se-stage.azurewebsites.net

and for the rest of all royaldesign and rum21 domains with the
https://royalweb-"LOCALE"-stage.azurewebsites.net - LOCALE being the only change

As a safety precaution deploying the release to the live environment is done by manually approving a release (just a click in VSTS given that you have the correct credentials). And they will end up on these URLs:
### royaldesign

  Royal SE - 
  https://royalweb-se-prod-deploy.azurewebsites.net
  
  Royal FI - 
  https://royalweb-fi-prod-deploy.azurewebsites.net
  
  Royal NO - 
  https://royalweb-no-prod-deploy.azurewebsites.net
  
  Royal DK - 
  https://royalweb-dk-prod-deploy.azurewebsites.net

  Royal DE - 
  https://royalweb-de-prod-deploy.azurewebsites.net
  
  Royal JP - 
  https://royalweb-jp-prod-deploy.azurewebsites.net
  
  Royal UK - 
  https://royalweb-uk-prod-deploy.azurewebsites.net
  
  Royal KR - 
  https://royalweb-kr-prod-deploy.azurewebsites.net

  Royal CH - 
  https://royalweb-ch-prod-deploy.azurewebsites.net
  
  Royal US - 
  https://royalweb-us-prod-deploy.azurewebsites.net
  
  Royal EU - 
  https://royalweb-eu-prod-deploy.azurewebsites.net
  
  Royal AU - 
  https://royalweb-au-prod-deploy.azurewebsites.net
  
  Royal AT - 
  https://royalweb-at-prod-deploy.azurewebsites.net

  Royal NL - 
  https://royalweb-nl-prod-royalweb-nl-prod-deploy.azurewebsites.net


### rum21 
  
  Rum21 SE - 
  https://r21web-se-prod-deploy.azurewebsites.net
  
  Rum21 NO - 
  https://r21web-no-prod-deploy.azurewebsites.net
  
  Rum21 FI - 
  https://r21web-fi-prod-deploy.azurewebsites.net
  
  Rum21 DK - 
  https://r21web-dk-prod-deploy.azurewebsites.net

# Housekeeping

## Updating react-scripts fork

```shell
# check out create-react-app repo
$ git clone git@github.com:facebookincubator/create-react-app.git
$ cd create-react-app

# checkout the branch/tag you want to update to
$ git checkout v1.0.17

# make subtree split to get a branch called react-scripts-v1.0.17 containing
# only the react-scripts package
$ git subtree split -P packages/react-scripts -b react-scripts-v1.0.17

# go to royal-web repo
$ cd ../royal-web

# add our create-react-app clone as a new remote. you only need to do this the first time
$ git remote add react-scripts-origin ../create-react-app

# merge the changes made to react-scripts origin
$ git subtree pull -P packages/react-scripts react-scripts-origin react-scripts-v1.0.17 --squash
```

For more info, check out [this gist](https://gist.github.com/alfredringstad/ac0f7a1e081e9ee485e653b6a8351212)

## Development

### Start dev server

Launch the dev server by following instructions in the README found in the monorepo root, or open a terminal in this folder and run
`yarn start`

Your browser should automatically open and load the React app.

### Folder Structure

The folder structure is based on the one generated by `create-react-app` but introduces some more structure.

```shell
royaldesign/
  README.md
  config.json
  locales/
    sv-SE.json
    ...
  node_modules/
  package.json
  public/
    index.html
    favicon.ico
    manifest.json
  src/
    client.js
    index.js
    server.js
    components/
      UI/
      App.js
    lib/
    store/
```

## Files and folders

#### README.md

This file. Contains instructions for development/building of this app, as well as how the code is organized. Should be updated when adding bigger features or making decisions with big impact.

#### config.json

A static config file, used in `react-scripts`. This is currently used to set up the translation tools - to let us know which locale is used in the inline translations inside the code, and which other locales that are available.

#### locales/

Folder containing the translation strings used when building the app. By default, the translations are written in Swedish inside the code. When using the `yarn translations extract` command, the translation strings are extracted into `sv-SE.json`. This file can then be used as a base for making translations.

#### node_modules/

Contains all dependencies. Should never be committed.

#### package.json

Contains dependency list as well as available yarn/npm commands. Handles versioning of other packages in this repo, meaning we could update the fork of react-scripts and add new features, but still pin the dependency to an older version if we'd like.

#### public/

Contains assets that are made statically available from the express server. Normally, you would not touch these files or add images/stylesheets/js-files here, but instead import these in files used in `src/`. Sometimes, however, this is necessary.

#### index.html

Main HTML template for the site. Needs to contain an element with the id `root` in order for the React app to mount correctly.

#### facicon.ico

Favicon for the site.

#### manifest.json

Web manifest used mainly on mobile phones when saving the app to the home screen (progressive web app).

#### src/

Contains all source code for the React app.

#### components/

Contains all React components used in the app.

##### UI/

Contains shared UI components (buttons, headers, paragraphs etc)

##### App.js

Entry point for React.

#### lib/

Helper files/API abstractions etc.

#### store/

Reducers and store files used with Redux.

#### actions/

Action creators used with Redux.

#### index.js

Main entry file. Renders <App> component with the correct rendering method on client and server.

#### client.js

Exports rendering function used in browser. Can be used to import code that should only be run on the client (e.g. service worker registration).

#### server.js

Exports rendering function used in server. Receives the template (index.html) and `react-loadable` stats from the wrapper around the `serve` command. Is used as an express middleware.

#### constants.js

Constants used within the app.

## Available Scripts

In the project directory, you can run:

### `yarn start`

Runs the app in the development mode.<br>
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br>
You will also see any lint errors in the console.

### `yarn test`

Launches the test runner in the interactive watch mode.<br>
See the section about [running tests](#running-tests) for more information.

### `yarn build`

Builds the app for production to the `build` folder.<br>
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br>
Your app is ready to be deployed!

See the section about [deployment](#deployment) for more information.

### `yarn serve`

Starts an express server that serves the JS bundle and does server side rendering. Note that you have to run `yarn build` first.

### `yarn translations`

Tools for working with translations.

#### `yarn translations extract`

Extracts translations from all JS files inside the `src/`-folder and outputs into the default locale file inside `locales/`.

The `translations.default` value in `config.json` determines which locale is default.

#### `yarn translations lint`

Runs lint on all translations specified in `translations.locales` of `config.json` and shows any errors or warnings.

### `yarn run`

will give you an overview of the available commands.
> Which command would you like to run?

## Styling

This project includes some packages to assist with styling components.

### CSS-in-JS

[Emotion](https://github.com/emotion-js/emotion) is used to style components and avoid specificity issues with CSS. It allows us to abstract CSS to the component level rather than maintaining global stylesheets.

### Grid System

In order to keep padding, margin, and positioning consistent, we use [grid-emotion](https://github.com/emotion-js/grid-emotion), which is the Emotion-based implementation of [grid-styled](https://github.com/jxnblk/grid-styled#readme). This is a responsive grid library that makes use of the [Flexible Box Module](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox) and exposes a `Flex` component and a `Box` component.

`Box` has margin and padding props that accept a number from `0-4`, representing a step on the spacing scale. This allows us to keep all margins and paddings consistent, and is the preferred way to define spacing. Negative numbers may also be used to set a negative margin.

`Box` also has a width prop, which can be used to easily create a grid when used within a `Flex` componenent. See the [Box docs](https://github.com/jxnblk/grid-styled#box-) for full implementation details.

`Flex` extends `Box`, but sets display to flex automatically. It includes props to set flex alignment, justification, direction etc. See [Flex docs](https://github.com/jxnblk/grid-styled#flex-).

Note that for both components the default underlying DOM element created is a `div`. This can be changed by passing an element type via the `is` prop (e.g.) `<Box is="nav" />` will create a `<nav>` DOM element.

## Supported Language Features and Polyfills

This project supports a superset of the latest JavaScript standard.<br>
In addition to [ES6](https://github.com/lukehoban/es6features) syntax features, it also supports:

* [Exponentiation Operator](https://github.com/rwaldron/exponentiation-operator) (ES2016).
* [Async/await](https://github.com/tc39/ecmascript-asyncawait) (ES2017).
* [Object Rest/Spread Properties](https://github.com/sebmarkbage/ecmascript-rest-spread) (stage 3 proposal).
* [Dynamic import()](https://github.com/tc39/proposal-dynamic-import) (stage 3 proposal)
* [Class Fields and Static Properties](https://github.com/tc39/proposal-class-public-fields) (part of stage 3 proposal).
* [JSX](https://facebook.github.io/react/docs/introducing-jsx.html) and [Flow](https://flowtype.org/) syntax.
* [Optional chaining](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) syntax. [https://github.com/tc39/proposal-optional-chaining](stage 4 proposal)

Learn more about [different proposal stages](https://babeljs.io/docs/plugins/#presets-stage-x-experimental-presets-).

While we recommend using experimental proposals with some caution, Facebook heavily uses these features in the product code, so we intend to provide [codemods](https://medium.com/@cpojer/effective-javascript-codemods-5a6686bb46fb) if any of these proposals change in the future.

Note that **the project only includes a few ES6 [polyfills](https://en.wikipedia.org/wiki/Polyfill)**:

* [`Object.assign()`](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) via [`object-assign`](https://github.com/sindresorhus/object-assign).
* [`Promise`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) via [`promise`](https://github.com/then/promise).
* [`fetch()`](https://developer.mozilla.org/en/docs/Web/API/Fetch_API) via [`whatwg-fetch`](https://github.com/github/fetch).

If you use any other ES6+ features that need **runtime support** (such as `Array.from()` or `Symbol`), make sure you are including the appropriate polyfills manually, or that the browsers you are targeting already support them.

## Formatting Code Automatically

Prettier is an opinionated code formatter with support for JavaScript, CSS and JSON. With Prettier you can format the code you write automatically to ensure a code style within your project. See the [Prettier's GitHub page](https://github.com/prettier/prettier) for more information, and look at this [page to see it in action](https://prettier.github.io/prettier/).

The whole monorepo is set up so that when you commit any js/json/md-files they will automatically be formatted with prettier.

You might also want to integrate Prettier in your favorite editor. Read the section on [Editor Integration](https://github.com/prettier/prettier#editor-integration) on the Prettier GitHub page.

## Installing a Dependency

To add a dependency (e.g. react) you simply run

`yarn add react`

Yarn will take care of putting the dependency in the correct `node_modules/`-folder as well as updating the `yarn.lock` file in the monorepo root. Make sure you commit this file after adding dependencies.

## Adding Images, Fonts, and Files

With Webpack, using static assets like images and fonts works similarly to CSS.

You can **`import` a file right in a JavaScript module**. This tells Webpack to include that file in the bundle. Unlike CSS imports, importing a file gives you a string value. This value is the final path you can reference in your code, e.g. as the `src` attribute of an image or the `href` of a link to a PDF.

To reduce the number of requests to the server, importing images that are less than 10,000 bytes returns a [data URI](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs) instead of a path. This applies to the following file extensions: bmp, gif, jpg, jpeg, and png. SVG files are excluded due to [#1153](https://github.com/facebookincubator/create-react-app/issues/1153).

Here is an example:

```javascript
import React from 'react';
import logo from './logo.png'; // Tell Webpack this JS file uses this image

console.log(logo); // /logo.84287d09.png

function Header() {
  // Import result is the URL of your image
  return <img src={logo} alt="Logo" />;
}

export default Header;
```

This ensures that when the project is built, Webpack will correctly move the images into the build folder, and provide us with correct paths.

Webpack finds all relative module references in CSS (they start with `./`) and replaces them with the final paths from the compiled bundle. If you make a typo or accidentally delete an important file, you will see a compilation error, just like when you import a non-existent JavaScript module. The final filenames in the compiled bundle are generated by Webpack from content hashes. If the file content changes in the future, Webpack will give it a different name in production so you don’t need to worry about long-term caching of assets.

Please be advised that this is also a custom feature of Webpack.

**It is not required for React** but many people enjoy it (and React Native uses a similar mechanism for images).<br>
An alternative way of handling static assets is described in the next section.

## Using the `public` Folder

> Note: this feature is available with `react-scripts@0.5.0` and higher.

### Changing the HTML

The `public` folder contains the HTML file so you can tweak it, for example, to [set the page title](#changing-the-page-title).
The `<script>` tag with the compiled code will be added to it automatically during the build process.

### Adding Assets Outside of the Module System

You can also add other assets to the `public` folder.

Note that we normally encourage you to `import` assets in JavaScript files instead.
For example, see the sections on [adding a stylesheet](#adding-a-stylesheet) and [adding images and fonts](#adding-images-fonts-and-files).
This mechanism provides a number of benefits:

* Scripts and stylesheets get minified and bundled together to avoid extra network requests.
* Missing files cause compilation errors instead of 404 errors for your users.
* Result filenames include content hashes so you don’t need to worry about browsers caching their old versions.

However there is an **escape hatch** that you can use to add an asset outside of the module system.

If you put a file into the `public` folder, it will **not** be processed by Webpack. Instead it will be copied into the build folder untouched. To reference assets in the `public` folder, you need to use a special variable called `PUBLIC_URL`.

Inside `index.html`, you can use it like this:

```html
<link rel="shortcut icon" href="%PUBLIC_URL%/favicon.ico">
```

Only files inside the `public` folder will be accessible by `%PUBLIC_URL%` prefix. If you need to use a file from `src` or `node_modules`, you’ll have to copy it there to explicitly specify your intention to make this file a part of the build.

When you run `npm run build`, Create React App will substitute `%PUBLIC_URL%` with a correct absolute path so your project works even if you use client-side routing or host it at a non-root URL.

In JavaScript code, you can use `process.env.PUBLIC_URL` for similar purposes:

```javascript
render() {
  // Note: this is an escape hatch and should be used sparingly!
  // Normally we recommend using `import` for getting asset URLs
  // as described in “Adding Images and Fonts” above this section.
  return <img src={process.env.PUBLIC_URL + '/img/logo.png'} />;
}
```

Keep in mind the downsides of this approach:

* None of the files in `public` folder get post-processed or minified.
* Missing files will not be called at compilation time, and will cause 404 errors for your users.
* Result filenames won’t include content hashes so you’ll need to add query arguments or rename them every time they change.

### When to Use the `public` Folder

Normally we recommend importing [stylesheets](#adding-a-stylesheet), [images, and fonts](#adding-images-fonts-and-files) from JavaScript.
The `public` folder is useful as a workaround for a number of less common cases:

* You need a file with a specific name in the build output, such as [`manifest.webmanifest`](https://developer.mozilla.org/en-US/docs/Web/Manifest).
* You have thousands of images and need to dynamically reference their paths.
* You want to include a small script like [`pace.js`](http://github.hubspot.com/pace/docs/welcome/) outside of the bundled code.
* Some library may be incompatible with Webpack and you have no other option but to include it as a `<script>` tag.

Note that if you add a `<script>` that declares global variables, you also need to read the next section on using them.

## Using Global Variables

When you include a script in the HTML file that defines global variables and try to use one of these variables in the code, the linter will complain because it cannot see the definition of the variable.

You can avoid this by reading the global variable explicitly from the `window` object, for example:

```javascript
const $ = window.$;
```

This makes it obvious you are using a global variable intentionally rather than because of a typo.

Alternatively, you can force the linter to ignore any line by adding `// eslint-disable-line` after it.

## Using HTTPS in Development

> Note: this feature is available with `react-scripts@0.4.0` and higher.


You may require the dev server to serve pages over HTTPS. One particular case where this could be useful is when using [the "proxy" feature](#proxying-api-requests-in-development) to proxy requests to an API server when that API server is itself serving HTTPS.

To do this, set the `HTTPS` environment variable to `true`, then start the dev server as usual with `npm start`

#### Windows (cmd.exe)

```shell
set HTTPS=true&&npm start
```

(Note: the lack of whitespace is intentional.)

#### Linux, macOS (Bash)

```shell
HTTPS=true npm start
```

Note that the server will use a self-signed certificate, so your web browser will almost definitely display a warning upon accessing the page.

## Running Tests

> Note: this feature is available with `react-scripts@0.3.0` and higher.<br> >[Read the migration guide to learn how to enable it in older projects!](https://github.com/facebookincubator/create-react-app/blob/master/CHANGELOG.md#migrating-from-023-to-030)

Create React App uses [Jest](https://facebook.github.io/jest/) as its test runner. To prepare for this integration, we did a [major revamp](https://facebook.github.io/jest/blog/2016/09/01/jest-15.html) of Jest so if you heard bad things about it years ago, give it another try.

Jest is a Node-based runner. This means that the tests always run in a Node environment and not in a real browser. This lets us enable fast iteration speed and prevent flakiness.

While Jest provides browser globals such as `window` thanks to [jsdom](https://github.com/tmpvar/jsdom), they are only approximations of the real browser behavior. Jest is intended to be used for unit tests of your logic and your components rather than the DOM quirks.

We recommend that you use a separate tool for browser end-to-end tests if you need them. They are beyond the scope of Create React App.

### Filename Conventions

Jest will look for test files with any of the following popular naming conventions:

* Files with `.js` suffix in `__tests__` folders.
* Files with `.test.js` suffix.
* Files with `.spec.js` suffix.

The `.test.js` / `.spec.js` files (or the `__tests__` folders) can be located at any depth under the `src` top level folder.

We recommend to put the test files (or `__tests__` folders) next to the code they are testing so that relative imports appear shorter. For example, if `App.test.js` and `App.js` are in the same folder, the test just needs to `import App from './App'` instead of a long relative path. Colocation also helps find tests more quickly in larger projects.

### Command Line Interface

When you run `npm test`, Jest will launch in the watch mode. Every time you save a file, it will re-run the tests, just like `npm start` recompiles the code.

The watcher includes an interactive command-line interface with the ability to run all tests, or focus on a search pattern. It is designed this way so that you can keep it open and enjoy fast re-runs. You can learn the commands from the “Watch Usage” note that the watcher prints after every run:

![Jest watch mode](http://facebook.github.io/jest/img/blog/15-watch.gif)

### Version Control Integration

By default, when you run `npm test`, Jest will only run the tests related to files changed since the last commit. This is an optimization designed to make your tests run fast regardless of how many tests you have. However it assumes that you don’t often commit the code that doesn’t pass the tests.

Jest will always explicitly mention that it only ran tests related to the files changed since the last commit. You can also press `a` in the watch mode to force Jest to run all tests.

Jest will always run all tests on a [continuous integration](#continuous-integration) server or if the project is not inside a Git or Mercurial repository.

### Writing Tests

To create tests, add `it()` (or `test()`) blocks with the name of the test and its code. You may optionally wrap them in `describe()` blocks for logical grouping but this is neither required nor recommended.

Jest provides a built-in `expect()` global function for making assertions. A basic test could look like this:

```javascript
import sum from './sum';

it('sums numbers', () => {
  expect(sum(1, 2)).toEqual(3);
  expect(sum(2, 2)).toEqual(4);
});
```

All `expect()` matchers supported by Jest are [extensively documented here](https://facebook.github.io/jest/docs/en/expect.html#content).<br>
You can also use [`jest.fn()` and `expect(fn).toBeCalled()`](https://facebook.github.io/jest/docs/en/expect.html#tohavebeencalled) to create “spies” or mock functions.

### Testing Components

There is a broad spectrum of component testing techniques. They range from a “smoke test” verifying that a component renders without throwing, to shallow rendering and testing some of the output, to full rendering and testing component lifecycle and state changes.

Different projects choose different testing tradeoffs based on how often components change, and how much logic they contain. If you haven’t decided on a testing strategy yet, we recommend that you start with creating simple smoke tests for your components:

```javascript
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<App />, div);
});
```

This test mounts a component and makes sure that it didn’t throw during rendering. Tests like this provide a lot value with very little effort so they are great as a starting point, and this is the test you will find in `src/App.test.js`.

When you encounter bugs caused by changing components, you will gain a deeper insight into which parts of them are worth testing in your application. This might be a good time to introduce more specific tests asserting specific expected output or behavior.

If you’d like to test components in isolation from the child components they render, we recommend using [`shallow()` rendering API](http://airbnb.io/enzyme/docs/api/shallow.html) from [Enzyme](http://airbnb.io/enzyme/). To install it, run:

```shell
npm install --save enzyme enzyme-adapter-react-16 react-test-renderer
```

Alternatively you may use `yarn`:

```shell
yarn add enzyme enzyme-adapter-react-16 react-test-renderer
```

As of Enzyme 3, you will need to install Enzyme along with an Adapter corresponding to the version of React you are using. (The examples above use the adapter for React 16.)

The adapter will also need to be configured in your [global setup file](#initializing-test-environment):

#### `src/setupTests.js`

```javascript
import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });
```

Now you can write a smoke test with it:

```javascript
import React from 'react';
import { shallow } from 'enzyme';
import App from './App';

it('renders without crashing', () => {
  shallow(<App />);
});
```

Unlike the previous smoke test using `ReactDOM.render()`, this test only renders `<App>` and doesn’t go deeper. For example, even if `<App>` itself renders a `<Button>` that throws, this test will pass. Shallow rendering is great for isolated unit tests, but you may still want to create some full rendering tests to ensure the components integrate correctly. Enzyme supports [full rendering with `mount()`](http://airbnb.io/enzyme/docs/api/mount.html), and you can also use it for testing state changes and component lifecycle.

You can read the [Enzyme documentation](http://airbnb.io/enzyme/) for more testing techniques. Enzyme documentation uses Chai and Sinon for assertions but you don’t have to use them because Jest provides built-in `expect()` and `jest.fn()` for spies.

Here is an example from Enzyme documentation that asserts specific output, rewritten to use Jest matchers:

```javascript
import React from 'react';
import { shallow } from 'enzyme';
import App from './App';

it('renders welcome message', () => {
  const wrapper = shallow(<App />);
  const welcome = <h2>Welcome to React</h2>;
  // expect(wrapper.contains(welcome)).to.equal(true);
  expect(wrapper.contains(welcome)).toEqual(true);
});
```

All Jest matchers are [extensively documented here](http://facebook.github.io/jest/docs/en/expect.html).<br>
Nevertheless you can use a third-party assertion library like [Chai](http://chaijs.com/) if you want to, as described below.

Additionally, you might find [jest-enzyme](https://github.com/blainekasten/enzyme-matchers) helpful to simplify your tests with readable matchers. The above `contains` code can be written simpler with jest-enzyme.

```javascript
expect(wrapper).toContainReact(welcome);
```

To enable this, install `jest-enzyme`:

```shell
npm install --save jest-enzyme
```

Alternatively you may use `yarn`:

```shell
yarn add jest-enzyme
```

Import it in [`src/setupTests.js`](#initializing-test-environment) to make its matchers available in every test:

```javascript
import 'jest-enzyme';
```

### Using Third Party Assertion Libraries

We recommend that you use `expect()` for assertions and `jest.fn()` for spies. If you are having issues with them please [file those against Jest](https://github.com/facebook/jest/issues/new), and we’ll fix them. We intend to keep making them better for React, supporting, for example, [pretty-printing React elements as JSX](https://github.com/facebook/jest/pull/1566).

However, if you are used to other libraries, such as [Chai](http://chaijs.com/) and [Sinon](http://sinonjs.org/), or if you have existing code using them that you’d like to port over, you can import them normally like this:

```javascript
import sinon from 'sinon';
import { expect } from 'chai';
```

and then use them in your tests like you normally do.

### Initializing Test Environment

> Note: this feature is available with `react-scripts@0.4.0` and higher.

If your app uses a browser API that you need to mock in your tests or if you just need a global setup before running your tests, add a `src/setupTests.js` to your project. It will be automatically executed before running your tests.

For example:

#### `src/setupTests.js`

```javascript
const localStorageMock = {
  getItem: jest.fn(),
  setItem: jest.fn(),
  clear: jest.fn()
};
global.localStorage = localStorageMock;
```

### Focusing and Excluding Tests

You can replace `it()` with `xit()` to temporarily exclude a test from being executed.<br>
Similarly, `fit()` lets you focus on a specific test without running any other tests.

### Coverage Reporting

Jest has an integrated coverage reporter that works well with ES6 and requires no configuration.<br>
Run `npm test -- --coverage` (note extra `--` in the middle) to include a coverage report like this:

![coverage report](http://i.imgur.com/5bFhnTS.png)

Note that tests run much slower with coverage so it is recommended to run it separately from your normal workflow.

#### Configuration

The default Jest coverage configuration can be overriden by adding any of the following supported keys to a Jest config in your package.json.

Supported overrides:

* [`collectCoverageFrom`](https://facebook.github.io/jest/docs/en/configuration.html#collectcoveragefrom-array)
* [`coverageReporters`](https://facebook.github.io/jest/docs/en/configuration.html#coveragereporters-array-string)
* [`coverageThreshold`](https://facebook.github.io/jest/docs/en/configuration.html#coveragethreshold-object)
* [`snapshotSerializers`](https://facebook.github.io/jest/docs/en/configuration.html#snapshotserializers-array-string)

Example package.json:

```javascript
{
  "name": "your-package",
  "jest": {
    "collectCoverageFrom": [
      "src/**/*.{js,jsx}",
      "!<rootDir>/node_modules/",
      "!<rootDir>/path/to/dir/"
    ],
    "coverageThreshold": {
      "global": {
        "branches": 90,
        "functions": 90,
        "lines": 90,
        "statements": 90
      }
    },
    "coverageReporters": ["text"],
    "snapshotSerializers": ["my-serializer-module"]
  }
}
```

### Continuous Integration

By default `npm test` runs the watcher with interactive CLI. However, you can force it to run tests once and finish the process by setting an environment variable called `CI`.

When creating a build of your application with `npm run build` linter warnings are not checked by default. Like `npm test`, you can force the build to perform a linter warning check by setting the environment variable `CI`. If any warnings are encountered then the build fails.

Popular CI servers already set the environment variable `CI` by default but you can do this yourself too:

### On CI servers

#### Travis CI

1. Following the [Travis Getting started](https://docs.travis-ci.com/user/getting-started/) guide for syncing your GitHub repository with Travis. You may need to initialize some settings manually in your [profile](https://travis-ci.org/profile) page.
1. Add a `.travis.yml` file to your git repository.

```docker
language: node_js
node_js:
  - 6
cache:
  directories:
    - node_modules
script:
  - npm run build
  - npm test
```

1. Trigger your first build with a git push.
1. [Customize your Travis CI Build](https://docs.travis-ci.com/user/customizing-the-build/) if needed.

#### CircleCI

Follow [this article](https://medium.com/@knowbody/circleci-and-zeits-now-sh-c9b7eebcd3c1) to set up CircleCI with a Create React App project.

### On your own environment

#### Windows (cmd.exe)

```shell
set CI=true&&npm test
```

```shell
set CI=true&&npm run build
```

(Note: the lack of whitespace is intentional.)

#### Linux, macOS (Bash)

```shell
CI=true npm test
```

```shell
CI=true npm run build
```

The test command will force Jest to run tests once instead of launching the watcher.

> If you find yourself doing this often in development, please [file an issue](https://github.com/facebookincubator/create-react-app/issues/new) to tell us about your use case because we want to make watcher the best experience and are open to changing how it works to accommodate more workflows.

The build command will check for linter warnings and fail if any are found.

### Disabling jsdom

By default, the `package.json` of the generated project looks like this:

```javascript
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test --env=jsdom"
```

If you know that none of your tests depend on [jsdom](https://github.com/tmpvar/jsdom), you can safely remove `--env=jsdom`, and your tests will run faster:

```shell
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
-   "test": "react-scripts test --env=jsdom"
+   "test": "react-scripts test"
```

To help you make up your mind, here is a list of APIs that **need jsdom**:

* Any browser globals like `window` and `document`
* [`ReactDOM.render()`](https://facebook.github.io/react/docs/top-level-api.html#reactdom.render)
* [`TestUtils.renderIntoDocument()`](https://facebook.github.io/react/docs/test-utils.html#renderintodocument) ([a shortcut](https://github.com/facebook/react/blob/34761cf9a252964abfaab6faf74d473ad95d1f21/src/test/ReactTestUtils.js#L83-L91) for the above)
* [`mount()`](http://airbnb.io/enzyme/docs/api/mount.html) in [Enzyme](http://airbnb.io/enzyme/index.html)

In contrast, **jsdom is not needed** for the following APIs:

* [`TestUtils.createRenderer()`](https://facebook.github.io/react/docs/test-utils.html#shallow-rendering) (shallow rendering)
* [`shallow()`](http://airbnb.io/enzyme/docs/api/shallow.html) in [Enzyme](http://airbnb.io/enzyme/index.html)

Finally, jsdom is also not needed for [snapshot testing](http://facebook.github.io/jest/blog/2016/07/27/jest-14.html).

### Snapshot Testing

Snapshot testing is a feature of Jest that automatically generates text snapshots of your components and saves them on the disk so if the UI output changes, you get notified without manually writing any assertions on the component output. [Read more about snapshot testing.](http://facebook.github.io/jest/blog/2016/07/27/jest-14.html)

### Editor Integration

If you use [Visual Studio Code](https://code.visualstudio.com), there is a [Jest extension](https://github.com/orta/vscode-jest) which works with Create React App out of the box. This provides a lot of IDE-like features while using a text editor: showing the status of a test run with potential fail messages inline, starting and stopping the watcher automatically, and offering one-click snapshot updates.

![VS Code Jest Preview](https://cloud.githubusercontent.com/assets/49038/20795349/a032308a-b7c8-11e6-9b34-7eeac781003f.png)

## Analyzing the Bundle Size

[Source map explorer](https://www.npmjs.com/package/source-map-explorer) analyzes
JavaScript bundles using the source maps. This helps you understand where code
bloat is coming from.

To add Source map explorer to a Create React App project, follow these steps:

```shell
npm install --save source-map-explorer
```

Alternatively you may use `yarn`:

```shell
yarn add source-map-explorer
```

Then in `package.json`, add the following line to `scripts`:

```diff
   "scripts": {
+    "analyze": "source-map-explorer build/static/js/main.*",
     "start": "react-scripts start",
     "build": "react-scripts build",
     "test": "react-scripts test --env=jsdom",
```

Then to analyze the bundle run the production build then run the analyze
script.

```shell
npm run build
npm run analyze
```

## Advanced Configuration

You can adjust various development and production settings by setting environment variables in your shell or with [.env](#adding-development-environment-variables-in-env).

| Variable            |      Development       |     Production     | Usage
| BROWSER             |   :white_check_mark:   |        :x:         | By default, Create React App will open the default system browser, favoring Chrome on macOS. Specify a [browser](https://github.com/sindresorhus/opn#app) to override this behavior, or set it to `none` to disable it completely. If you need to customize the way the browser is launched, you can specify a node script instead. Any arguments passed to `npm start` will also be passed to this script, and the url where your app is served will be the last argument. Your script's file name must have the `.js` extension.|

| HOST                |   :white_check_mark:   |        :x:         | By default, the development web server binds to `localhost`. You may use this variable to specify a different host.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| PORT                |   :white_check_mark:   |        :x:         | By default, the development web server will attempt to listen on port 3000 or prompt you to attempt the next available port. You may use this variable to specify a different port.                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| HTTPS               |   :white_check_mark:   |        :x:         | When set to `true`, Create React App will run the development server in `https` mode.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| PUBLIC_URL          |          :x:           | :white_check_mark: | Create React App assumes your application is hosted at the serving web server's root or a subpath as specified in [`package.json` (`homepage`)](#building-for-relative-paths). Normally, Create React App ignores the hostname. You may use this variable to force assets to be referenced verbatim to the url you provide (hostname included). This may be particularly useful when using a CDN to host your application.                                                                                                                                                                                                |
| CI                  | :large_orange_diamond: | :white_check_mark: | When set to `true`, Create React App treats warnings as failures in the build. It also makes the test runner non-watching. Most CIs set this flag by default.                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| REACT_EDITOR        |   :white_check_mark:   |        :x:         | When an app crashes in development, you will see an error overlay with clickable stack trace. When you click on it, Create React App will try to determine the editor you are using based on currently running processes, and open the relevant source file. You can [send a pull request to detect your editor of choice](https://github.com/facebookincubator/create-react-app/issues/2636). Setting this environment variable overrides the automatic detection. If you do it, make sure your systems [PATH](<https://en.wikipedia.org/wiki/PATH_(variable)>) environment variable points to your editor’s bin folder. |

| CHOKIDAR_USEPOLLING |   :white_check_mark:   |        :x:         | When set to `true`, the watcher runs in polling mode, as necessary inside a VM. Use this option if `npm start` isn't detecting changes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| GENERATE_SOURCEMAP  |          :x:           | :white_check_mark: | When set to `false`, source maps are not generated for a production build. This solves OOM issues on some smaller machines. |

## Troubleshooting

### `npm start` doesn’t detect changes

When you save a file while `npm start` is running, the browser should refresh with the updated code.<br>
If this doesn’t happen, try one of the following workarounds:

* If your project is in a Dropbox folder, try moving it out.

* If the watcher doesn’t see a file called `index.js` and you’re referencing it by the folder name, you [need to restart the 
watcher](https://github.com/facebookincubator/create-react-app/issues/1164) due to a Webpack bug.

* Some editors like Vim and IntelliJ have a “safe write” feature that currently breaks the watcher. You will need to disable it. 
Follow the instructions in [“Adjusting Your Text Editor”](https://webpack.js.org/guides/development/#adjusting-your-text-editor).

* If your project path contains parentheses, try moving the project to a path without them. This is caused by a [Webpack watcher 
bug](https://github.com/webpack/watchpack/issues/42).

* On Linux and macOS, you might need to [tweak system settings](https://webpack.github.io/docs/troubleshooting.
html#not-enough-watchers) to allow more watchers.

* If the project runs inside a virtual machine such as (a Vagrant provisioned) VirtualBox, create an `.env` file in your project 
directory if it doesn’t exist, and add `CHOKIDAR_USEPOLLING=true` to it. This ensures that the next time you run `npm start`, the watcher uses the polling mode, as necessary inside a VM.

If none of these solutions help please leave a comment [in this thread](https://github.com/facebookincubator/create-react-app/issues/659).

### `npm test` hangs on macOS Sierra

If you run `npm test` and the console gets stuck after printing `react-scripts test --env=jsdom` to the console there might be a problem with your [Watchman](https://facebook.github.io/watchman/) installation as described in [facebookincubator/create-react-app#713](https://github.com/facebookincubator/create-react-app/issues/713).

We recommend deleting `node_modules` in your project and running `npm install` (or `yarn` if you use it) first. If it doesn't help, you can try one of the numerous workarounds mentioned in these issues:

* [facebook/jest#1767](https://github.com/facebook/jest/issues/1767)
* [facebook/watchman#358](https://github.com/facebook/watchman/issues/358)
* [ember-cli/ember-cli#6259](https://github.com/ember-cli/ember-cli/issues/6259)

It is reported that installing Watchman 4.7.0 or newer fixes the issue. If you use [Homebrew](http://brew.sh/), you can run these commands to update it:

```shell
watchman shutdown-server
brew update
brew reinstall watchman
```

You can find [other installation methods](https://facebook.github.io/watchman/docs/install.html#build-install) on the Watchman documentation page.

If this still doesn’t help, try running `launchctl unload -F ~/Library/LaunchAgents/com.github.facebook.watchman.plist`.

There are also reports that _uninstalling_ Watchman fixes the issue. So if nothing else helps, remove it from your system and try again.

### `npm run build` exits too early

It is reported that `npm run build` can fail on machines with limited memory and no swap space, which is common in cloud environments. Even with small projects this command can increase RAM usage in your system by hundreds of megabytes, so if you have less than 1 GB of available memory your build is likely to fail with the following message:

> The build failed because the process exited too early. This probably means the system ran out of memory or someone called `kill -9` on the process.

If you are completely sure that you didn't terminate the process, consider [adding some swap space](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04) to the machine you’re building on, or build the project locally.

### `npm run build` fails to minify

Some third-party packages don't compile their code to ES5 before publishing to npm. This often causes problems in the ecosystem because neither browsers (except for most modern versions) nor some tools currently support all ES6 features. We recommend to publish code on npm as ES5 at least for a few more years.

<br>
To resolve this:

1. Open an issue on the dependency's issue tracker and ask that the package be published pre-compiled.

* Note: Create React App can consume both CommonJS and ES modules. For Node.js compatibility, it is recommended that the main entry point is CommonJS. However, they can optionally provide an ES module entry point with the `module` field in `package.json`. Note that **even if a library provides an ES Modules version, it should still precompile other ES6 features to ES5 if it intends to support older browsers**.

2. Fork the package and publish a corrected version yourself.

3. If the dependency is small enough, copy it to your `src/` folder and treat it as application code.

In the future, we might start automatically compiling incompatible third-party modules, but it is not currently supported. This approach would also slow down the production builds.


# React scripts

This package includes scripts and configuration used by [Create React App](https://github.com/facebook/create-react-app).<br>
Please refer to its documentation:

- [Getting Started](https://github.com/facebook/create-react-app/blob/master/README.md#getting-started) – How to create a new app.
- [User Guide](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md) – How to develop apps bootstrapped with Create React App.


# Enviroments

Most secrets and domain specfic values are managed with various .env files 
in `royal-web/env`
Env files are used as global variables with domain specific values to control features that are used in some domains

values in these files can be passed into the client side of the applications by using the prefix `REACT_APP`

ex: `REACT_APP_TRUSTPILOT_LINK=https://no.trustpilot.com/`

prod/ = production enviroments
stage/ = development enviroments

shared enviroment variables (non domain specific) are placed in files named `common`

each application also has a local .env is used for local development the local .env file override the others during development. 

enviroment files found in 
```shell
Project root/
   env/
      r21/
         prod/
         stage/


      royaldesign/
         prod/
         stage/
```
for each domain there is a corresponding .env file in both `prod/` and `stage/`


