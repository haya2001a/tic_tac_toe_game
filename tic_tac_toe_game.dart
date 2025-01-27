import 'dart:io';


List<String> board = List.filled(9, ' ');


bool player1Turn = true;


void main() {
  
  while (true) {
    printBoard();
    getMove();
    if (checkWin('X')) {
      print('Player X wins!');
      break;
    } else if (checkWin('O')) {
      print('Player O wins!');
      break;
    } else if (isBoardFull()) {
      print('It\'s a draw!');
      break;
    }
    player1Turn = !player1Turn;
  }
  print('Game over. Would you like to play again? (y/n)');
  if (stdin.readLineSync()?.toLowerCase() == 'y') {
    resetGame();
    main();
  }
}

void printBoard() {
  print('-------------');
  for (int i = 0; i < 9; i += 3) {
    print('| ${board[i]} | ${board[i + 1]} | ${board[i + 2]} |');
    print('-------------');
  }
}

void getMove() {
  int move;
  do {
    print('Player ${player1Turn ? 'X' : 'O'}, enter a number (1-9):');
    move = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  } while (move < 1 || move > 9 || board[move - 1] != ' ');
  board[move - 1] = player1Turn ? 'X' : 'O';
}

bool checkWin(String player) {
  return (board[0] == player && board[1] == player && board[2] == player) ||
         (board[3] == player && board[4] == player && board[5] == player) ||
         (board[6] == player && board[7] == player && board[8] == player) ||
         (board[0] == player && board[3] == player && board[6] == player) ||
         (board[1] == player && board[4] == player && board[7] == player) ||
         (board[2] == player && board[5] == player && board[8] == player) ||
         (board[0] == player && board[4] == player && board[8] == player) ||
         (board[2] == player && board[4] == player && board[6] == player);
}

bool isBoardFull() {
  return !board.contains(' ');
}

void resetGame() {
  board = List.filled(9, ' ');
  player1Turn = true;
}
