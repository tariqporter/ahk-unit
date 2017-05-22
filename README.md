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

You will need to create a `ahk-unit.conf.js` in your root, to provide the path of `Autohotkey.exe`

`ahk-unit.conf.js`
```js
exports.config = () => {
	return {
		ahkPath: "c:\\program files\\Autohotkey\\Autohotkey.exe"
	};
}
```