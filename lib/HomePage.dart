import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  //TODO: link up images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

  //todo initialize the state of bix with empty
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      checkTurns();
    });
  }

  //todo getimage method
  AssetImage getimage(String value) {
    switch(value) {
      case "empty": return this.edit;
      case "circle": return this.circle;
      case "cross": return this.cross;
      default: return this.edit;
    }
  }

  // todo playgame method
  playGame(int position ) {
    if (this.gameState[position] == "empty") {
      setState(() {
        if (this.isCross) {
          gameState[position] = "cross";
        }  else {
          gameState[position] = "circle";
        }
        this.isCross = !isCross;
        checkWin();
      });
    }
  }

  // todo reset game method
  resetGame () {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.checkTurns();
    });
  }

  checkWin() {
    final EMPTY = "empty";
    if (gameState[0] != EMPTY &&
        gameState[0] == gameState[1] &&
          gameState[1] == gameState[2]) {
      setState(() {
        this.message = this.gameState[0] + ' wins the match';
      });
    } else if (gameState[3] != EMPTY &&
        gameState[3] == gameState[4] &&
        gameState[4] == gameState[5]){
      setState(() {
        this.message = this.gameState[3] + ' wins the match';
      });
    } else if (gameState[6] != EMPTY &&
        gameState[6] == gameState[7] &&
        gameState[7] == gameState[8]){
      setState(() {
        this.message = this.gameState[6] + ' wins the match';
      });
    } else if (gameState[0] != EMPTY &&
        gameState[0] == gameState[4] &&
        gameState[4] == gameState[8]){
      setState(() {
        this.message = this.gameState[0] + ' wins the match';
      });
    } else if (gameState[2] != EMPTY &&
        gameState[2] == gameState[4] &&
        gameState[4] == gameState[6]) {
      setState(() {
        this.message = this.gameState[2] + ' wins the match';
      });
    } else if (gameState[0] != EMPTY &&
        gameState[0] == gameState[3] &&
        gameState[6] == gameState[3]) {
      setState(() {
        this.message = this.gameState[0] + ' wins the match';
      });
    } else if (gameState[1] != EMPTY &&
        gameState[1] == gameState[4] &&
        gameState[4] == gameState[7]) {
      setState(() {
        this.message = this.gameState[1] + ' wins the match';
      });
    } else if (gameState[2] != EMPTY &&
        gameState[2] == gameState[5] &&
        gameState[5] == gameState[8]) {
      setState(() {
        this.message = this.gameState[2] + ' wins the match';
      });
    } else if (!gameState.contains(EMPTY)) {
      setState(() {
        this.message = 'The game is draw';
      });
    } else {
      setState(() {
        checkTurns();
      });
    }
  }

  void checkTurns() {
    if (this.isCross) {
      this.message = 'cross turn';
    } else {
      this.message = 'circle turn';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1,
                ),
                itemCount: this.gameState.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100,
                  height: 100,
                  child: MaterialButton(
                    color: Colors.amber,
                      onPressed: () {
                        this.playGame(i);
                      },
                    child: Image(
                      image: this.getimage(gameState[i]),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ),
                  ),
                ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(message, style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: MaterialButton(
                  color: Colors.white,
                  child: Text("Reset Game",style: TextStyle(
                    color: Colors.red
                  ),),
                  onPressed: (){
                    resetGame();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    )
                  ),
                ),
              )

            ],
          ),
        ],
      )
    );
  }



}

