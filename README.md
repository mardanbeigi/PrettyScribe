# PrettyScribe

PrettyScribe is a simple single-page web application that renders BattleScribe roster files in
a (hopefully) useful format for viewing on device or printing.   The PrettyScribe application
is inspired by the (poorly named but quite useful) ButtScribe, http://www.buttscri.be/, application.

Currently PrettyScribe supports roster files for Warhammer 40k, Warhammer 40k Kill Team,
Warhammer Age of Sigmar, Warhammer Warcry and Warhammer 30k.

This work was started as an exercise in learning web-development (Javascript, Typescript, etc.) and
a passion for the table-top wargamming hobby in general.

PrettyScribe is very much a work in progress.   Suggestions, bugs, comments are welcomed.

If you actually use this tool and find it useful let me know.

## Building

### Quick Start

Prettyscribe is written in Typescript and uses npm for initialization, compiling and launching a
dev server at http://localhost:8080.

    $ git clone https://github.com/rweyrauch/PrettyScribe.git
    $ cd PrettyScribe
    $ npm install
    $ npm run dev

### Details

Prettyscribe uses Vite for compilation of the Typescript into Javascript and bundling.

To build PrettyScribe:

    $ npm run build

To preview the production build locally:

    $ npm run preview

### Tests

Prettyscribe uses jasmine tests to validate roster parsing.   Test rosters live under the `test/`
directory.   Test specs live under `spec/` and are generated via a command, but should be reviewed
manually to verify changes.

Only 40k has tests, and parsing fixes must include minimal rosters and specs verifying the fix.

To run PrettyScribe tests:

    $ npm test

To (re)generate PrettyScribe tests:

    $ npm run writetests

### Docker

To run inside a sandboxed [Docker](https://www.docker.com/) container:

    $ docker compose up

Tests can be executed with:

    $ docker compose run --rm web npm test

Tests can be (re)generated with:
    $ docker compose run --rm web npm run writetests

#### Package dependencies

The Docker container needs `package-lock.json` to match `package.json`. If you only edit `package.json`, the build will fail.

To update `package-lock.json`, first run `docker compose up` with the current `package.json`, then add your new dependencies to `package.json` and run:
    $ docker compose run --rm web npm install
    $ docker compose down -v --rmi all
    $ docker compose up
