class HadithWidget extends StatefulWidget {
    HadithWidget({super.key,
    required this.index});
int index;

  @override
  State<HadithWidget> createState() => _HadithWidgetState();
}

class _HadithWidgetState extends State<HadithWidget> {
HadithDataModel? hadithDataModel;
@override
  void initState(){
  super.initState();
loadhadithContent(widget.index);
}
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      width: width.width * 0.7,
      height: height.height * 0.6,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.primaryColor,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0,),
            child: Image(
              image: AssetImage(Assets.hadithbgslider),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        hadithDataModel?.title??"",
                        style: theme.textTheme.headlineSmall!.copyWith(
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    hadithDataModel?.content??"",
    style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
    textAlign: TextAlign.center,
    ),
    ),
              ],
            ),
          ),
        ],
      ),
    );
  }



    Future<void> loadhadithContent(int index) async {

      String hadithFile=await rootBundle.loadString("assets/files/Hadeeth/h${index+1}.txt");
      int filelineIndex=hadithFile.indexOf("\n");
      String title=hadithFile.substring(0,filelineIndex);
      String content=hadithFile.substring(filelineIndex+1);
hadithDataModel=HadithDataModel(title: title, content: content);
setState(() {

});
    }
}

