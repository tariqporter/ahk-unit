# ahk-unit
Unit testing library for Autohotkey

### ahk-unit library is located in the `dist` folder
###
###
### Alternatively if you wish to have automated tests on change of any Included file

Install `ahk-unit` as a dependency of your project

```bash
npm install --save-dev ahk-unit
```

To run the examples, simply at the root of this project run

```bash
 node .\bin\ahk-unit .\examples\tests.ahk
```

For your own project, you will need to create a `ahk-unit.conf.js` in your root, to provide the path of `Autohotkey.exe`

`ahk-unit.conf.js`
```js
exports.config = () => {
	return {
		ahkPath: "c:\\program files\\Autohotkey\\Autohotkey.exe"
	};
}
```

Inside your project you can then have continous tests running

`package.json`
```
"scripts": {
  "test": "ahk-unit ./tests/tests.ahk"
}
```

This will load `tests.ahk` and all files included inside it.
Your test file should include `ahk-unit.ahk`

```
#Include %A_ScriptDir%\..\node_modules\ahk-unit\lib\ahk-unit.ahk
```

Any class to be tested should extend the `AhkUnit` class

```
class MyClassTest extends AhkUnit
```