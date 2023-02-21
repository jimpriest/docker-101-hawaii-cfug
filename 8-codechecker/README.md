# CodeChecker and Other CI Tools

Pete Frietag at Foundeo has built a use Docker image with a collection of tools
useful in a CI environment:

See: https://github.com/foundeo/cfml-ci-tools

Tools included:

- fixinator
- cfml-compiler
- commandbox-codechecker
- commandbox-cflint
- commandbox-cfformat
- commandbox-dotenv
- commandbox-cfconfig
- commandbox-docbox
- commandbox-semantic-release

Let's look how we can quickly use one of these.  Codechecker will scan your code and notify you
based on set of rules you pick of any issues.  Look at the .codecheck.json file included in this
directory for an example.  For this case we'll just look for cfdump tags in our code.

This image already included Commandbox so we can simply run a 'box' command:

```
docker run -v $PWD:/app foundeo/cfml-ci-tools box codechecker run --failOnMatch
```

See the Codechecker docs for more info: https://www.forgebox.io/view/commandbox-codechecker




