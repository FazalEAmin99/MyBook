import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chapter6 extends StatefulWidget {
  const Chapter6({super.key});

  @override
  _Chapter6State createState() => _Chapter6State();
}

class _Chapter6State extends State<Chapter6> {
  final ChapterName = "Mrs. Perfect";
  final chapterContent = """
  "acorn, belief, caramel, destiny, empathy, fragrance, gleam, harmony, igloo, jigsaw, kaleidoscope, labyrinth, melody, nebula, oasis, parchment, quantum, rainbow, serendipity, twinkle, ultraviolet, velvet, whisper, xenon, yawn, zest, aroma, banter, cascade, drizzle, enchantment, flourish, galaxy, haze, iridescent, jolt, kindness, lantern, meadow, nuance, orchid, pulsar, quiver, ripple, stardust, tranquil, utopia, vibrant, wanderlust, xenial, yearn, zephyr, almond, breeze, crinkle, dappled, effervescent, flicker, gossamer, hushed, infinite, jingle, knoll, luminous, murmuration, nocturne, opalescent, pensive, quagmire, reverie, silken, tempest, unison, vivid, wharf, xylophone, yield, azure, beacon, cobblestone, dewdrop, elation, flicker, glisten, hazy, intricate, jasmine, kale, luster, misty, nocturnal, opaque, petal, quixotic, rapture, shimmering, thistle, undulate, verdant, whirlpool, xenogenesis, yellow, zeal, auburn, brisk, cypress, dune, ethereal, frost, glimmer, hoarfrost, intrepid, juniper, knapsack, lichen, moonlight, nimbus, orchard, petrichor, quill, ripple, saffron, thicket, umbra, valiant, wisteria, xenodochial, youthful, zephyr, amethyst, bramble, crimson, dew, ember, fern, grotto, hollow, iridescence, jade, kelp, lupine, moss, nymph, opal, primrose, quartz, reflection, sapphire, tendril, unearthly, verdure, whisper, xanthic, yeoman, zenith, azure, brook, canary, dappled, eglantine, fulgent, glade, heather, ivy, jasmine, kith, lull, marigold, nettle, obelisk, peony, quasar, rainbow, solstice, twilight, utopian, vernal, willow, xylem, yellow, zircon, amble, briar, crystal, dragonfly, estuary, foxglove, glen, hemlock, inkling, juniper, kaleidoscope, lagoon, meadow, nymph, oasis, primrose, quartz, ripple, sedge, twinkling, undergrowth, vine, whisper, xerox, yarrow, zinnia, aloe, brook, camellia, daisy, echinacea, fiddlehead, geyser, hollyhock, iris, jacinth, knoll, lupin, meadow, nightshade, ocelot, pebbled, quartzite, rose, sprig, tangle, upland, vine, waterfall, xenon, yew, zephyr, arbutus, birch, chamomile, daffodil, echo, fern, glimmer, heather, indigo, jessamine, kittiwake, laurel, magnolia, nightingale, olive, petunia, quince, ripple, sage, timber, upsurge, violet, waterlily, xylocarp, yonder, zygote, agate, breeze, chrysalis, dusk, elm, faun, glade, holly, iris, junco, kelp, lavender, mulberry, nymph, orchid, peony, quaking, reed, sylvan, tremor, upland, valley, wind, xerox, yearling, zephyr, aspen, boulder, citrine, deluge, ember, fern, glisten, honeysuckle, ivy, juniper, knot, lily, meadow, nightshade, opalescent, pine, quaver, rhubarb, stream, thicket, underbrush, vine, woodland, xeranthemum, yarrow, zephyr, acacia, brook, chrysanthemum, dew, elfin, fuchsia, grove, hemlock, indigo, jasmine, kelp, lilac, marigold, nocturne, olive, poplar, quince, river, sorrel, thistle, umbra, vale, willow, xenon, yucca, zinnia, amber, brook, clematis, dappled, elm, fawn, glimmer, hyacinth, iridescent, jasmine, kinnikinnick, lichen, meadow, nocturne, opal, petunia, quaver, reed, sunbeam, thicket, undergrowth, vernal, willow, xerox, yarrow, zinnia, arboretum, bluebell, cobweb, daisy, elm, fern, glimmer, honeysuckle, iris, jasmine, kelp, lilac, meadow, nightshade, opal, pine, quince, river, snowdrop, tulip, updraft, vine, waterfall, xeranthemum, yarrow, zephyr."
  """;

  String? highlightedText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chapter 6",
            style: TextStyle(fontFamily: 'Georgia', fontSize: 24)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white, // White background
        child: SingleChildScrollView(
          child: GestureDetector(
            onLongPressStart: (details) {
              final renderBox = context.findRenderObject() as RenderBox;
              final localPosition =
                  renderBox.globalToLocal(details.globalPosition);
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(
                    localPosition.dx, localPosition.dy, 0, 0),
                items: [
                  PopupMenuItem(
                    child: Text("Highlight"),
                    onTap: () {
                      setState(() {
                        highlightedText = chapterContent.substring(
                            0, 100); // Sample highlight
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Copy"),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: chapterContent));
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Share"),
                    onTap: () {
                      // Share functionality can be added using a package like `share_plus`
                    },
                  ),
                ],
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ChapterName,
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Georgia',
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black text
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 5,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    chapterContent,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Georgia',
                      color: Colors.black, // Black text
                      height: 1.6,
                      letterSpacing: 0.5,
                      backgroundColor: highlightedText != null
                          ? Colors.yellow
                          : null, // Highlight text if selected
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.mail, color: Colors.white),
        backgroundColor: Colors.black, // Black button
        tooltip: 'Contact Us',
      ),
    );
  }
}
