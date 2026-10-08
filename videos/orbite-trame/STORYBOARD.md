---
format: 1920x1080
duration: 46s
message: "Une balade dans l'espace : chaque section du site est une escale — une planète ou une station spatiale"
arc: Départ (orbite basse) → 5 escales contrastées → Arrivée (éclipse)
audience: visiteurs du site (fond scroll-scrubbé, contenu HTML par-dessus)
mode: collaborative
---

# Orbite — trame de fond

## Décisions

- **Message** : un voyage continu dans un seul espace 3D ; chaque section est une escale (planète ou station) que la caméra aborde avec un mouvement qui lui est propre.
- **Format** : 1920×1080, 30 fps, 46 s, sans voix, sans musique, **sans aucun texte**. Pilotée au scroll → jamais de cut ni de flash ; les transits sont des vols continus.
- **Fil conducteur (spine)** : le champ d'étoiles (3 couches de parallaxe) et une même lumière de soleil, toujours venant du même côté de l'univers — on sent qu'on traverse un seul système.
- **Variété** : chaque escale change à la fois d'objet, de palette, de mouvement caméra **et** de côté pour la zone de texte (gauche / droite / centre en alternance).
- **Technique** : une seule scène Three.js, procédurale et seedée (planètes en shaders, stations en géométrie), caméra pilotée par le temps.
- **Palette** : fond bleu nuit #05060c (jamais noir pur), étoiles blanc chaud #fff4e6 ; chaque escale apporte sa teinte (voir frames).
- **Zones de contenu** : 2 s de transit + 4 s de zone stable (mouvement lent) par section. L'objet occupe un côté, l'autre côté reste calme (étoiles seules) pour le texte.
- **Interdits** : pas de texte / logo ; pas de cut, pas de flash blanc plein écran ; pas de grain animé ; pas de dégradé linéaire plein écran (banding) ; pas d'« hyperespace » répété à chaque transit (une seule fois max).
- **Livrables** : MP4 H.264 encodé pour le scrub, WebM VP9, poster JPG (frame 0), `sections.json` (temps de chaque section) pour brancher le scroll.

## Frame 1 — Hero : lever de planète

- scene: Grande planète océan bleu-turquoise dont l'horizon courbe occupe le bas-droit, halo d'atmosphère, soleil qui pointe derrière le limbe
- duration: 10s
- start: 0
- hold: 0–7.5s
- motion: lente montée en grue au-dessus de l'horizon (crane up), le soleil se dégage du limbe
- text_zone: haut-gauche
- tint: #3fb5c9
- status: outline
- src: index.html

## Frame 2 — Station orbitale en anneau

- scene: Station en roue (tore + rayons + moyeu) qui tourne lentement, lumières chaudes aux hublots
- duration: 6s
- start: 10
- hold: 12–16s
- motion: arc orbital autour de la station (la caméra tourne autour, la roue tourne en sens inverse)
- text_zone: gauche (station à droite)
- tint: #e8e2d6 + #ffb35c
- status: outline
- src: index.html

## Frame 3 — Géante gazeuse à anneaux

- scene: Géante ocre/ambre à bandes, anneaux fins inclinés qui traversent le cadre
- duration: 6s
- start: 16
- hold: 18–22s
- motion: la caméra plonge sous le plan des anneaux avec un léger roulis (bank)
- text_zone: droite (planète à gauche)
- tint: #d99a4e
- status: outline
- src: index.html

## Frame 4 — Ceinture d'astéroïdes et lune de glace

- scene: Astéroïdes sombres au premier plan qui défilent, petite lune glacée bleu pâle au fond
- duration: 6s
- start: 22
- hold: 24–28s
- motion: travelling latéral (truck) à travers la ceinture, fort parallaxe
- text_zone: gauche (lune à droite, astéroïdes en bordure)
- tint: #a9d6ef
- status: outline
- src: index.html

## Frame 5 — Station solaire devant une nébuleuse

- scene: Longue poutre-treillis couverte de panneaux solaires, nébuleuse teal/rose diffuse au loin
- duration: 6s
- start: 28
- hold: 30–34s
- motion: dolly parallèle le long de la structure, en contre-plongée
- text_zone: haut (structure en diagonale basse)
- tint: #39c2a7 + #e0688f
- status: outline
- src: index.html

## Frame 6 — Planète rouge et sa lune

- scene: Planète désertique rouille, cratères, ligne jour/nuit (terminateur), petite lune grise
- duration: 6s
- start: 34
- hold: 36–40s
- motion: approche frontale qui ralentit (push-in), la lune passe devant
- text_zone: droite (planète à gauche-bas)
- tint: #c4532f
- status: outline
- src: index.html

## Frame 7 — Arrivée : éclipse

- scene: Planète sombre centrée devant son étoile : anneau de lumière dorée (corona), rayons fins
- duration: 6s
- start: 40
- hold: 42–46s
- motion: la caméra s'aligne et se pose, l'anneau se complète ; dernière frame tenue
- text_zone: centre (sous l'éclipse) — idéal footer / contact
- tint: #ffc46b
- status: outline
- src: index.html
