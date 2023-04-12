//
//  Plant.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

struct Plant {
    let popularName: String
    let scientificName: String
    let origin: String
    let imagePath: String
    let iconPath: String
    let description: String
    let trivia: [String]
}


extension Plant {
    static func getPlants() -> [Plant] {
        return [
            Plant(popularName: "Pitangueira",
                  scientificName: "Eugenia uniflora",
                  origin: "Cerrado, Mata Altântica e Pampa",
                  imagePath: "pitangueira",
                  iconPath: "Pitangueira Completa",
                  description: "É uma árvore frutífera, que pode atingir até 10 metros de altura. Suas folhas são verde-escuras e seus frutos são redondos e têm uma cor vermelha quando maduros, com sabor doce e ácido ao mesmo tempo. É muito comum em pomares domésticos e também é cultivada comercialmente em várias regiões do Brasil.",
                  trivia: ["Dizem que o conhaque de pitangas era a bebida favorita de Gilberto Freyre, criada pelo mesmo",
                           "Suas folhas são usadas para fazer chás para ajudar contra diarreias persistentes e doenças do fígado",
                           "Por ser muito adaptável às condições de clima e solo, ela é cultivada em vários cantos do mundo, como no Hawaii, Madagascar, China e muitos outros"]),
            Plant(popularName: "Vitória-régia",
                  scientificName: "Victoria amazonica",
                  origin: "Região amazônica",
                  imagePath: "vitoriaRegia",
                  iconPath: "Vitoria Regia Completa",
                  description: "É uma planta aquática nativa da região amazônica. É conhecida por suas folhas grandes e redondas, que podem chegar a medir até 2,5 metros de diâmetro, sendo uma das maiores folhas do reino vegetal. As folhas têm bordas elevadas e são capazes de flutuar na água, criando uma espécie de bacia, que pode ser utilizada como abrigo por diversos animais.",
                  trivia: ["Apesar de não ser convencional, é possível se alimentar das sementes, talo, flores e caule da vitória-régia",
                           "Suas flores são brancas e perfumadas, e abrem somente à noite, sobrevivendo por apenas 48 horas.",
                           "O seu nome foi dado em homenagem à Rainha Vitória do Reino Unido. Na época, era considerada uma das maiores maravilhas naturais do mundo."]),
            Plant(popularName: "Pau-Brasil",
                  scientificName: "Paubrasilia echinata",
                  origin: "Mata Atlântica",
                  imagePath: "pauBrasil",
                  iconPath: "Pau brasil Completo",
                  description: "É uma árvore de grande porte, que pode atingir até 15 metros de altura. É nativa da Mata Atlântica brasileira e era muito abundante no período colonial. Suas folhas são pequenas suas flores amarelas. O fruto do pau-brasil é uma cápsula que contém sementes, sendo uma importante fonte de alimento para diversos animais da região.",
                  trivia: ["Por ser uma árvore em risco de extinção, o pau-brasil só pode ser cortada para a produção do arco do violino",
                           "Na época do Brasil Imperial, o pau-brasil foi a primeira 'madeira de lei' do Brasil, o que significava que só podiam ser extraída com autorização da coroa.",
                           "Durante a colonização do Brasil, a madeira era valiosa por sua cor avermelhada, que era usada para tingir tecidos e fabricar objetos de luxo na Europa"]),
            Plant(popularName: "Ipê-amarelo",
                  scientificName: "Handroanthus albus",
                  origin: "Floresta de Araucária, floresta semidecidual e cerrado",
                  imagePath: "ipeAmarelo",
                  iconPath: "Ipe amarelo Completo",
                  description: "É uma árvore de grande porte, podendo atingir até 30 metros de altura. Suas folhas são compostas e suas flores são grandes e vistosas, com coloração amarela intensa. É uma espécie que apresenta grande resistência a condições adversas, como a seca e o fogo, sendo considerada uma espécie-chave na recuperação de áreas degradadas.",
                  trivia: ["Ele é considerado a flor símbolo do Brasil, já que, quando floresce em setembro, as cores de suas flores e folhas, amarelo e verde, representam a bandeira nacional",
                           "As flores do ipê-amarelo maceradas com mel e água morna ajudam em inflamações da garganta, boca e gengiva",
                           "Por ter flores com formato de pequenas trombetas, elas são muito atrativas para grande parte dos animais polinizadores, como vespas, abelhas e borboletas"]),
            Plant(popularName: "Mandacaru",
                  scientificName: "Cereus jamacaru",
                  origin: "Semiárido do Nordeste brasileiro",
                  imagePath: "mandacaru",
                  iconPath: "Mandacaru Completo",
                  description: "É uma planta espinhosa e suculenta, que pode atingir até 5 metros de altura. Os frutos do mandacaru são vermelhos e comestíveis, sendo muito apreciados por aves e outros animais da região. O mandacaru é uma planta muito resistente à seca e às condições adversas do clima, sendo considerada um símbolo da região Nordeste do Brasil.",
                  trivia: ["As suas flores são brancas, desabrocham à noite e murcham ao nascer do sol",
                           "Há evidências da planta até em telhados de casa, isso porque não demandam um tratamento específico e podem brotar em lugares inusitados.",
                           "Os seus espinhos possuem a função de defesa contra animais herbívoros."]),
            Plant(popularName: "Brinco-de-princesa",
                  scientificName: "Fuchsia",
                  origin: "Sul do Brasil e regiões serranas",
                  imagePath: "brincoDePrincesa",
                  iconPath: "Brinco de princesa Completa",
                  description: "É conhecida por suas flores exuberantes, em formato de sino. As flores do brinco-de-princesa são geralmente pendentes e possuem longos estames, o que as torna bastante ornamentais. As folhas do brinco-de-princesa são verdes e ovais, com textura macia. ",
                  trivia: ["Algumas espécies de beija-flores são atraídas pelas flores do Brinco-de-Princesa, o que faz com que a planta seja muito utilizada em paisagismo." ,
                           "O Brinco-de-Princesa é uma planta que pode ser facilmente propagada por estaquia, ou seja, através de um pedaço de galho da planta que é plantado em substrato úmido." ,
                           "Existem mais de 200 espécies de Brinco-de-Princesa, que variam em tamanho, formato e cor das flores."]),
            Plant(popularName: "Primavera",
                  scientificName: "Bougainvillea spectabilis",
                  origin: "Nordeste do Brasil",
                  imagePath: "primavera",
                  iconPath: "Red Plant",
                  description: "É uma planta trepadeira, de crescimento rápido, que pode chegar a 5 metros de altura. É uma planta resistente e pode ser cultivada em condições climáticas adversas, desde que receba luz solar direta.",
                  trivia: ["Ela possui flores pequenas, brancas ou amarelas, rodeadas por brácteas coloridas. As brácteas são folhas modificadas, que muitas vezes são confundidas com as flores, mas são na verdade estruturas de proteção das flores verdadeiras." ,
                           "Pode ser uma planta invasora em algumas áreas. Ela pode se espalhar rapidamente e sufocar outras plantas nativas, tornando-se uma ameaça para a biodiversidade." ,
                           "Seu nome é uma homenagem ao explorador francês Louis Antoine de Bougainville, que liderou uma expedição ao redor do mundo, em 1766 e a levou para os solos franceses."]),
            Plant(popularName: "Carnaúba",
                  scientificName: "Copernicia prunifera)",
                  origin: "Nordeste do Brasil",
                  imagePath: "carnauba",
                  iconPath: "Violet Plant",
                  description: "É uma palmeira alta e robusta, nativa do Nordeste do Brasil, sendo uma das mais importantes da região devido aos múltiplos usos de suas partes. Suas folhas são utilizadas para a fabricação de tecidos; sua seiva é usada na produção de cera; e seu fruto é consumido na forma de coco.",
                  trivia: ["A árvore é considerada símbolo do estado do Ceará, onde é amplamente cultivada e homenageada na bandeira do estado." ,
                           "A cera de Carnaúba é considerada a mais dura do mundo, com ponto de derretimento superior que a maioria das ceras, e por isso é amplamente utilizada em automóveis." ,
                           "Seu nome é uma homenagem ao explorador francês Louis Antoine de Bougainville, que liderou uma expedição ao redor do mundo, em 1766 e a levou para os solos franceses."]),
            Plant(popularName: "Cajueiro",
                  scientificName: "Anacardium occidentale)",
                  origin: "Nordeste do Brasil",
                  imagePath: "cajueiro",
                  iconPath: "Green Plant",
                  description: "O cajueiro é uma árvore de grande porte, que produz tanto o caju quanto a castanha de caju. A árvore é perene, podendo chegar a 12 metros de altura, com folhas verdes e brilhantes e flores pequenas e amareladas. O fruto do cajueiro tem formato de pêra e contém uma semente, a castanha de caju.",
                  trivia: ["O cajueiro é uma das poucas plantas em que a parte comestível não é o fruto, mas sim o pedúnculo floral (o Caju)." ,
                           "A castanha de caju é rica em vitaminas e minerais, além de conter antioxidantes e gorduras saudáveis. É a castanha mais consumida do mundo." ,
                           "O maior Cajueiro do mundo está no Rio Grande do nNorte com mais de 130 anos de idade."]),
        ]
    }
    
    static func getPlant(popularName: String) -> Plant? {
        return getPlants().filter {
            $0.popularName == popularName
        }.first
    }
    
}
