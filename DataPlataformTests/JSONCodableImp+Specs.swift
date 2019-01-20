import Quick
import Nimble

@testable import DataPlataform

final class JSONCodableImpSpecs: QuickSpec {
    override func spec() {
        let codable = JSONCodableImp()
        
        describe("JSONCodableImp") {
            describe("encode") {
                it("returns coded data correctly") {
                    let model = ModelStub()
                    let result = codable.encode(model)
                    
                    expect(result).toNot(beNil())
                }
            }
            
            describe("decode") {
                it("returns decoded data correctly") {
                    let model = ModelStub()
                    let data = codable.encode(model)!
                    let result = codable.decode(ModelStub.self, from: data)
                    
                    expect(result).toNot(beNil())
                }
            }
        }
    }
}
