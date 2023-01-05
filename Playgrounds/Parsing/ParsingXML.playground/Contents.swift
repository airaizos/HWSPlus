import Foundation
/**
 **04.Ene.2023**
##Parsing XML##
[Parsing XML the easy way
](https://www.hackingwithswift.com/plus/working-with-data/parsing-xml-the-easy-way)
**/

final class XMLNode {
    let tag: String
    var data: String
    let attributes: [String:String]
    var childNodes: [XMLNode]
    
    init(tag: String, data: String, attributes: [String:String], childNodes: [XMLNode]) {
        self.tag = tag
        self.data = data
        self.attributes = attributes
        self.childNodes = childNodes
    }
    
    func getAttribute(_ name: String) -> String? {
        attributes[name]
    }
    
    func getElementsByTagName(_ name: String) -> [XMLNode] {
        var results = [XMLNode]()
        
        for node in childNodes {
            if node.tag == name {
                results.append(node)
            }
            results += node.getElementsByTagName(name)
        }
        return results
    }
}

final class MicroDOM: NSObject, XMLParserDelegate {
    private let parser: XMLParser
    private var stack = [XMLNode]()
    private var tree: XMLNode?
    
    init(data: Data) {
        parser = XMLParser(data: data)
        super.init()
        parser.delegate = self
    }
    func parse() -> XMLNode? {
        parser.parse()
        
        guard parser.parserError == nil else { return nil }
        return tree
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String:String] = [:]) {
        let node = XMLNode(tag: elementName, data: "", attributes: attributeDict, childNodes: [XMLNode]())
        stack.append(node)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        let lastElement = stack.removeLast()
        
        if let last = stack.last {
            last.childNodes += [lastElement]
        } else {
             tree  = lastElement
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        stack.last?.data += string
    }
}


let string = "<root><h1>Hello!</h1><h1>World!</h1></root>"
let htmlExample = """
<html>
<body>

<h1>My First Heading</h1>
<p>My first paragraph.</p>

</body>
</html>
"""

let motos = """
<resultado><totalCount>1</totalCount><start>0</start><rows>50</rows><facetas><faceta><name>temas_smultiple</name><etiqueta>Temas</etiqueta><values><valor-faceta><name>Transporte</name><count>1</count></valor-faceta></values></faceta><faceta><name>content_type</name><etiqueta>Formato</etiqueta><values><valor-faceta><name>API</name><count>1</count></valor-faceta><valor-faceta><name>CSV</name><count>1</count></valor-faceta><valor-faceta><name>JSON</name><count>1</count></valor-faceta><valor-faceta><name>JSON-LD</name><count>1</count></valor-faceta><valor-faceta><name>RDF-N3</name><count>1</count></valor-faceta><valor-faceta><name>RDF-XML</name><count>1</count></valor-faceta><valor-faceta><name>SPARQL</name><count>1</count></valor-faceta><valor-faceta><name>SPARQL-JSON</name><count>1</count></valor-faceta><valor-faceta><name>SPARQL-XML</name><count>1</count></valor-faceta><valor-faceta><name>XML</name><count>1</count></valor-faceta></values></faceta><faceta><name>keywords_smultiple</name><etiqueta>Palabras clave</etiqueta><values><valor-faceta><name>aparcamiento</name><count>1</count></valor-faceta><valor-faceta><name>estacionamiento</name><count>1</count></valor-faceta><valor-faceta><name>moto</name><count>1</count></valor-faceta><valor-faceta><name>movilidad urbana</name><count>1</count></valor-faceta><valor-faceta><name>parking</name><count>1</count></valor-faceta><valor-faceta><name>servicio público</name><count>1</count></valor-faceta></values></faceta><faceta><name>geo_b</name><etiqueta>Geográfico</etiqueta><values><valor-faceta><name>true</name><count>1</count></valor-faceta></values></faceta></facetas><result><dataset><id>334</id><title>Estacionamientos motos</title><description><![CDATA[<p>Materia:Transporte <acronym property="rdfs:label" xml:lang="en" title="SPARQL Query" class="risp-sparql-xml">SPARQL</acronym> <acronym property="rdfs:label" xml:lang="en" title="JSON for Linking Data" class="risp-json">JSON-LD</acronym> <acronym property="rdfs:label" xml:lang="en" title="JavaScript Object Notation" class="risp-json">JSON</acronym> <acronym property="rdfs:label" xml:lang="en" title="Resource Description Framework Extensible Markup Language" class="risp-rdf-xml">RDF-XML</acronym> <acronym property="rdfs:label" xml:lang="en" title="Extensible Markup Language" class="risp-xml">XML</acronym> <acronym property="rdfs:label" title="Texto separado por comas" class="risp-csv">CSV</acronym> <acronym property="rdfs:label" xml:lang="en" title="Resource Description Framework N3" class="risp-rdf-n3">RDF-N3</acronym> <acronym property="rdfs:label" xml:lang="en" title="SPARQL Query Results XML" class="risp-sparql-xml">SPARQL-XML</acronym> <span property="rdfs:label" class="risp-soap">API</span> <acronym property="rdfs:label" xml:lang="en" title="SPARQL Query Results JavaScript Object Notation" class="risp-sparql-json">SPARQL-JSON</acronym></p>]]></description><accrualPeriodicity>[]</accrualPeriodicity><editor>Ayuntamiento de Zaragoza. Servicio de Movilidad Urbana</editor><formato><formato><mediaType>SPARQL</mediaType></formato><formato><mediaType>JSON-LD</mediaType></formato><formato><mediaType>JSON</mediaType></formato><formato><mediaType>RDF-XML</mediaType></formato><formato><mediaType>XML</mediaType></formato><formato><mediaType>CSV</mediaType></formato><formato><mediaType>RDF-N3</mediaType></formato><formato><mediaType>SPARQL-XML</mediaType></formato><formato><mediaType>API</mediaType></formato><formato><mediaType>SPARQL-JSON</mediaType></formato></formato><tag><tag><title>parking</title></tag><tag><title>servicio público</title></tag><tag><title>estacionamiento</title></tag><tag><title>moto</title></tag><tag><title>movilidad urbana</title></tag><tag><title>aparcamiento</title></tag></tag><materia><materia><title>Transporte</title><link>./?fq=temas_smultiple:("Transporte")</link></materia></materia><geo>S</geo><vis>S</vis><dash>S</dash><lastUpdated>2022-06-16T00:00:00Z</lastUpdated><explorable>true</explorable><author>rnotivol</author><lastModified>2022-06-16T00:00:00Z</lastModified><name>Estacionamientos motos</name><anyoneVisible>false</anyoneVisible><anyoneEditable>false</anyoneEditable><keywords>parking,servicio público,estacionamiento,moto,movilidad urbana,aparcamiento,</keywords><sameAs>http://www.zaragoza.es/api/recurso/dataset/334</sameAs></dataset></result></resultado>
"""

let dom = MicroDOM(data: Data(motos.utf8))
let tree = dom.parse()
print(tree?.tag ?? "")

if let tags = tree?.getElementsByTagName("name") {
    for tag in tags {
        print(tag.data)
    }
}
