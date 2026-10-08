# Orbite — intégration au site (scroll-scrub)

Fichiers livrés dans `renders/` :

| Fichier | Usage |
| --- | --- |
| `orbite-scrub.mp4` | H.264, une image-clé toutes les 5 images — défilement fluide au scroll (Safari, Chrome, Firefox) |
| `orbite-scrub.webm` | VP9, même principe, plus léger pour Chrome/Firefox |
| `orbite-poster.jpg` | Première image, à afficher pendant le chargement |
| `orbite-mobile.mp4` | 1280×720, plus léger pour mobile |

`sections.json` donne, pour chaque section, le temps du transit et de la zone stable
(`hold`) : c'est pendant `hold` que le texte de la section doit être visible.

## Principe

Chaque section du site occupe une hauteur de scroll ; la progression du scroll
dans une section est convertie en temps vidéo (`transit` puis `hold`).

```html
<video id="bg" src="renders/orbite-scrub.mp4" poster="renders/orbite-poster.jpg"
       muted playsinline preload="auto"></video>
<main>
  <section data-stop="hero">…</section>
  <section data-stop="station">…</section>
  <!-- … une <section> par escale, dans l'ordre de sections.json -->
</main>
```

```css
#bg { position: fixed; inset: 0; width: 100vw; height: 100vh; object-fit: cover; z-index: -1; }
main section { min-height: 150vh; }
```

```js
const SECTIONS = (await (await fetch("sections.json")).json()).sections;
const video = document.getElementById("bg");
const blocks = [...document.querySelectorAll("[data-stop]")];

let target = 0;
function onScroll() {
  const mid = window.scrollY + innerHeight / 2;
  for (let i = 0; i < blocks.length; i++) {
    const el = blocks[i];
    const top = el.offsetTop, h = el.offsetHeight;
    if (mid < top + h || i === blocks.length - 1) {
      const p = Math.min(1, Math.max(0, (mid - top) / h));
      const s = SECTIONS[i];
      const start = s.transit ? s.transit[0] : s.hold[0];
      target = start + p * (s.hold[1] - start);
      break;
    }
  }
}
// lissage : la vidéo rattrape le scroll en douceur
function tick() {
  const cur = video.currentTime;
  const next = cur + (target - cur) * 0.18;
  if (Math.abs(next - cur) > 0.002) video.currentTime = next;
  requestAnimationFrame(tick);
}
addEventListener("scroll", onScroll, { passive: true });
onScroll();
tick();
```

Conseils :
- Gardez `muted playsinline` (obligatoire sur iOS) ; ne lancez jamais `play()`.
- Sur iOS, appelez `video.load()` au premier `touchstart` si l'image reste figée.
- Pour un scroll encore plus fluide sur mobile, servez `orbite-mobile.mp4`.
