class MyObjectTest extends AhkUnit {
	beforeEach() {
		this.myObj := new MyObject(100, 200)
	}

	myTest1() {
		d := this.describe("MyObject")
		d.it("Width should be 100").expect(this.myObj.width == 100).toBeTruthy()
		d.it("Height should be 200").expect(this.size1.height == 200).toBeTruthy()
	}
	
	myTest2() {
		d := this.describe("Failing tests")

		;Some tests that will fail
		;--------------------------------
		
		;toBe(value) is x == value
		x := 101
		d.it("x should equal 100").expect(x).toBe(100)
		
		;toEqual(value) is the contents of x equal to y - deep object recursion
		x := { a: 10, b: "hello", c: { a: 20 } }
		y := { a: 10, b: "hello", c: { a: 30 } }
		d.it("x should be equal to y").expect(x).toEqual(y)
		
		;toBeTruthy()  is x true
		x := false
		d.it("x should be true").expect(x).toBeTruthy()
		
		;toBeFalsy() is x false
		x := true
		d.it("x should be true").expect(x).toBeFalsy()
		
		;toBeDefined() is x not ""
		x := ""
		d.it("x should be defined").expect(x).toBeDefined()
		
		;toBeLessThan(value) is x < value
		x := 100
		d.it("x should be less than 100").expect(x).toBeLessThan(99)
		
		;toBeGreaterThan(value) is x > value
		x := 100
		d.it("x should greater than 101").expect(x).toBeGreaterThan(101)
		
		;toContain(value) does x contain value - Instr()
		x := "Hello World!"
		d.it("x should contain 'Hallo'").expect(x).toContain("Hallo")
		
		;toMatrch(value) does x contain regular expression value
		x := "Hello World"
		d.it("x should contain '^Hallo\s+World!$'").expect(x).toMatch("^Hallo\s+World!$")
	}
}

class MyObject {
	__New(width, height) {
		this.width := width
		this.height := height
	}
}
