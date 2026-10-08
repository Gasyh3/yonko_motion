---
format: 1920x1080
duration: 46s
message: "Un voyage continu le long d'une allée sacrée cyberpunk, qui change d'atmosphère à chaque section du site"
arc: Seuil (torii) → Avancée → Bascules de teinte rose → violet → Arrivée
audience: visiteurs du site (fond scroll-scrubbé, contenu HTML par-dessus)
mode: collaborative
---

# Sandō — trame de fond

## Décisions

- **Message** : on remonte un *sandō* (allée de sanctuaire) au cœur d'une mégapole ; chaque section du site est une station de ce chemin, et la lumière glisse du noir & blanc vers le rose puis le violet.
- **Format** : 1920×1080, 30 fps, 46 s, sans voix, sans musique, **sans aucun texte** (ni kanji, ni enseigne lisible). Pilotée au scroll (scroll-scrub) → mouvement caméra continu vers l'avant, jamais de retour arrière, jamais de cut.
- **Fil conducteur (spine)** : l'allée elle-même — dalles de pierre, rangées de lanternes *tōrō* qui rythment chaque section, tapis de pétales au sol. La caméra ne quitte jamais l'axe de l'allée.
- **Technique** : une seule scène Three.js (procédurale, seedée, déterministe), caméra pilotée par le temps.
- **Palette** : base noir/blanc (#08070b → #f2eef3), torii rouge vermillon #d6283a (seul rouge de la vidéo), puis teinte de section : blush #f3c6d8 → sakura #ff8fbf → magenta #ff3fa4 → orchidée #c65bd8 → violet #8a5cf6 → ultraviolet #5a3fe0.
- **Zones de contenu** : chaque section = 2 s de travelling (rapide, *ease in-out*) + 4 s de zone stable (avancée très lente) où le texte du site s'affiche. Exposition globale contenue, centre-bas calme, pour que du texte blanc reste lisible par-dessus.
- **Interdits** : pas de texte / kanji / logos ; pas de flash ni de cut (le scrub doit rester fluide) ; pas de grain animé (gonfle l'encodage toutes-images-clés) ; pas de dégradé linéaire plein écran (banding).
- **Livrables** : MP4 H.264 encodé pour le scrub (GOP très court), WebM VP9, poster JPG de la frame 0, et `sections.json` (temps de début/zone stable de chaque section) pour brancher le scroll.

## Frame 1 — Hero : le torii

- scene: Torii rouge au premier plan, longue allée en perspective, mégatours N&B de chaque côté, pétales clairs qui tombent
- duration: 10s
- start: 0
- hold: 0–7.5s
- tint: monochrome + rouge torii, pétales blanc rosé
- transition_in: cut
- status: outline
- src: index.html

Ouverture : la caméra est posée devant un grand torii vermillon. Derrière lui, l'allée s'enfonce jusqu'à l'horizon, bordée de lanternes de pierre éteintes et de tours cybernétiques colossales en noir & blanc (grilles de fenêtres, antennes, passerelles, panneaux lumineux vierges). Les pétales tombent lentement ; un tapis de pétales couvre les dalles. Lent *push-in* (0 → 7.5 s), puis la caméra passe sous le torii (7.5 → 10 s).

## Frame 2 — Section 2 : Blush

- scene: On est dans l'allée ; premières lanternes allumées en rose pâle, pétales blush
- duration: 6s
- start: 10
- hold: 12–16s
- tint: #f3c6d8
- transition_in: travelling continu
- status: outline
- src: index.html

## Frame 3 — Section 3 : Sakura

- scene: Les néons des tours virent au rose sakura, brume rose basse, pétales sakura
- duration: 6s
- start: 16
- hold: 18–22s
- tint: #ff8fbf
- transition_in: travelling continu
- status: outline
- src: index.html

## Frame 4 — Section 4 : Magenta

- scene: Passerelle lumineuse qui enjambe l'allée, reflets magenta sur les dalles mouillées
- duration: 6s
- start: 22
- hold: 24–28s
- tint: #ff3fa4
- transition_in: travelling continu
- status: outline
- src: index.html

## Frame 5 — Section 5 : Orchidée

- scene: Bascule vers le violet, rangée de petits torii rapprochés (effet tunnel ouvert), pétales orchidée
- duration: 6s
- start: 28
- hold: 30–34s
- tint: #c65bd8
- transition_in: travelling continu
- status: outline
- src: index.html

## Frame 6 — Section 6 : Violet

- scene: Tours plus hautes, plus denses, brouillard violet, pétales violets
- duration: 6s
- start: 34
- hold: 36–40s
- tint: #8a5cf6
- transition_in: travelling continu
- status: outline
- src: index.html

## Frame 7 — Section 7 : Ultraviolet (arrivée)

- scene: Fin de l'allée : grand sanctuaire / second torii en silhouette devant une lune rose-violet, pétales ultraviolets
- duration: 6s
- start: 40
- hold: 42–46s
- tint: #5a3fe0
- transition_in: travelling continu
- status: outline
- src: index.html

Arrivée : la caméra ralentit et se pose face à la fin du chemin. Dernière frame tenue — idéale pour le footer / contact.
