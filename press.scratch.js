var T = '<div class="press-review"><div class="press-review-logo"><a href="URL"><img src="SRC"></a></div><div class="press-review-referral">  <a href="URL">URL</a>  </div>  <div class="press-review-text"><p>TEXT</p></div></div>';
var R = [{

url: "http://www.deconome.com/2016/03/15/beau-canape-boutique-en-ligne-a-connaitre/"
,
text: "C’est une des dépenses de mobilier les plus importantes et une de celles qu’il ne faut pas prendre à la légère. Un beau canapé dans le salon constitue le clou du décor. Généralement, on prend beaucoup de temps à trouver la perle rare." 

},{
url: "http://maisonetdemeure.com/nouveau-au-quebec-la-boutique-en-ligne-element-de-base/"
,
text: "Le mobilier est fonctionnel et pratique. L’esthétique est jeune, moderne, mais neutre. C’est que la mission de tout ce que vous trouverez chez élément de base, du canapé à la table "

},{
url: "http://www.theglobeandmail.com/life/home-and-garden/decor/montreal-siblings-launch-online-shop-for-affordable-high-quality-furniture/article28998921/"
,
text: "First, they launched design label Periphere. Then, they opened the retail branch Domison. Now, Montreal siblings My and Thien Ta Trung are going online with Élément de base, a furniture company offering high-quality, local design with affordable"
},{
url: "http://www.lapresse.ca/maison/decoration/design/201603/15/01-4960892-vendre-le-design-autrement.php"
,
text: "Après avoir fondé les marques de mobilier Periphere et Domison, Thien Ta Trung et sa soeur My reviennent sur la scène du design québécois avec"

},{

url:"http://index-design.ca/article/2016/3/6/le-retour-de-thien-et-my-element-de-base"
,
text: "LE DUO FONDATEUR DES SOCIÉTÉS PERIPHERE ET DOMISON FAIT UN RETOUR SUR LA SCÈNE DU DESIGN MONTRÉALAIS AVEC UNE NOUVELLE ENTITÉ RÉUNISSANT SA VISION DU MOBILIER ET SON ÉVOLUTION DANS LE FUTUR."

},{

url: "http://ericbeauchemin.com/?p=1038"

,
text: "Je me demandais justement ce qu’il était advenu de Domisson. Il semblerait que Thien et My Ta Trung ne se soient pas tourné les pouces. Ils nous proposent un nouveau concept "

},{

url: "http://www.sightunseen.com/2016/03/week-of-march-14-2016/"
,
text: "First came Hem, and now, Montreal’s Element de Base are making crazy affordable furnishings sold only direct-to-consumer online. We’re particularly jazzed on the site’s Perplexe side tables"

},{
url: "http://www.lapresse.ca/le-quotidien/toit-et-moi/201603/11/01-4959781-mobilier-quebecois-evolutif-et-a-mini-prix.php"
,
text: "Avec Élément de base, My et Thien jettent les bases d'un commerce d'achat en ligne durable et responsable. Leur objectif: inspirer des architectures intérieures créatives"
},{


url: "http://www.journal-du-design.fr/design/presentation-element-de-base-72008"
,
text: "Le duo fondateur des sociétés Periphere et Domison fait un retour sur la scène du design montréalais avec une nouvelle entité réunissant sa vision du mobilier et son évolution dans le futur. My Ta Trung et son frère Thien reviennent en force avec élément de base, une expérience de commerce singulière."

},{

url: "http://v2com-newswire.com/fr/salle-de-presse/categories/design-de-produit/dossiers-de-presse/2038-01/une-conception-locale-de-mobilier-evolutif-produit-a-mini-prix"
,
text: "Le duo fondateur des sociétés Periphere et Domison fait un retour sur la scène du design montréalais avec une nouvelle entité réunissant sa vision du mobilier et son évolution dans le futur. "
}

]


var H = '';

R.forEach( function( r ){
  H += "\n" + T.replace(/URL/g,r.url).replace(/TEXT/g,r.text)
})

console.log( H )




