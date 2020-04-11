# Fake It 'Till You Make It
<p align="center">
	A unit testing utility for faking dependencies in Lua
	<br />
	<br />
	<a href="https://github.com/Bytebit-Org/fitumi/actions">
        <img src="https://github.com/Bytebit-Org/fitumi/workflows/CI/badge.svg" alt="CI status" />
    </a>
	<a href="http://makeapullrequest.com">
		<img src="https://img.shields.io/badge/PRs-welcome-blue.svg" alt="PRs Welcome" />
	</a>
	<a href="https://opensource.org/licenses/MIT">
		<img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License: MIT" />
	</a>
	<a href="https://discord.gg/QEz3v8y">
		<img src="https://img.shields.io/badge/discord-join-7289DA.svg?logo=discord&longCache=true&style=flat" alt="Discord server" />
	</a>
</p>

Fake It 'Till You Make It, or fitumi, is a Lua faking library intended for helping to create comprehensive unit tests for Lua code bases. While not required, fitumi was designed with Roblox development as the primary use-case. Fitumi's design is inspired in part by [FakeItEasy](https://fakeiteasy.github.io/).

Fitumi comes paired with TypeScript annotation files for easy installation into a roblox-ts project and is published to NPM under the [@rbxts/fitumi](https://www.npmjs.com/package/@rbxts/fitumi) package.

## Links
- [API Documentation](DOCUMENTATION.md)

## Example
```lua
local fitumi = require(path.to.fitumi)
local a = fitumi.a

local fakeDependency = a.fake()
a.callTo(fakeDependency["foo"], fakeDependency, fitumi.wildcard):returns("bar")

local targetObject = TargetClass.new(fakeDependency)
targetObject:doSomething()

assert(a.callTo(fakeDependency["foo"], fakeDependency, fitumi.wildcard):didHappen(), "No call to foo happened")
assert(targetObject.fooResult == "bar", "targetObject's foo result does not match provided foo result")
assert(a.writeTo(fakeDependency, "expectedKey", "expectedValue"):didHappen(), "targetObject did not write \"expectedValue\" to \"expectedKey\"")
```
