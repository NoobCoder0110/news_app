import 'package:flutter/material.dart';

import 'widegts/detail_list.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.byLine,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.image,
    required this.caption,
  });

  final String title, subTitle, byLine;
  final String? image, caption;
  final List<String>? desFacet, orgFacet, perFacet, geoFacet;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  double _textSize = 16;
  
  void _increaseTextSize() {
    setState(() {
      _textSize += 2;
    });
  }

  void _decreaseTextSize() {
    setState(() {
      if(_textSize > 14) _textSize -= 2;
    });
  }
  // final List<dynamic>? geoFacet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(onPressed: () {_increaseTextSize();}, icon: const Icon(Icons.zoom_in),),
          IconButton(onPressed: () {_decreaseTextSize();}, icon: const Icon(Icons.zoom_out),),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                  child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: _textSize,
                    ),
              )),
              const SizedBox(height: 10),
              if (widget.image != null && widget.image!.isNotEmpty) Image.network(widget.image!),
              const SizedBox(height: 5),
              if (widget.caption != null && widget.caption!.isNotEmpty)
                Text(
                  "\" ${widget.caption} \"",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: _textSize, fontStyle: FontStyle.italic,),
                ),
              const SizedBox(height: 5),
              widget.subTitle.isEmpty
                  ? const SizedBox.shrink()
                  : Column(
                      children: [
                        Text(
                          widget.subTitle,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: _textSize),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
              Text(
                "Reported ${widget.byLine}",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: _textSize),
              ),
              const SizedBox(height: 5),
              Divider(color: Theme.of(context).colorScheme.surface.withOpacity(0.4),),
              const SizedBox(height: 5),
              widget.desFacet!.isEmpty
                  ? const SizedBox.shrink()
                  : DetailList(title: "Description", list: widget.desFacet, textsize: _textSize,),
              widget.orgFacet!.isEmpty
                  ? const SizedBox.shrink()
                  : DetailList(title: "Organization", list: widget.orgFacet,textsize: _textSize,),
              widget.perFacet!.isEmpty
                  ? const SizedBox.shrink()
                  : DetailList(title: "Topic", list: widget.perFacet,textsize: _textSize,),
              widget.geoFacet!.isEmpty
                  ? const SizedBox.shrink()
                  : DetailList(title: "Geolocation", list: widget.geoFacet,textsize: _textSize,),
            ],
          ),
        ),
      ),
    );
  }
}
