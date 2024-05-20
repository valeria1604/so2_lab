import random
import time

def is_player_starting():
    choice = input("Do you want to start? (yes/no): ").strip().lower()
    if choice == 'yes':
        return True
    elif choice == 'no':
        return False
    else:
        print("Invalid choice, using coin toss to decide.")
        return random.choice([True, False])

def get_user_move(board):
    size = len(board)
    start_time = time.time()
    while True:
        try:
            if time.time() - start_time > 5:
                print("Time's up! You took too long.")
                return board
            move = input("Enter your move as row,col: ")
            row, col = map(int, move.split(','))
            if board[row][col] == ' ':
                board[row][col] = 'X'
                return board
            else:
                print("Invalid move, cell is already taken.")
        except ValueError:
            print("Invalid input, please enter row and column as numbers.")

def ai_move(board):
    size = len(board)
    for i in range(size):
        for j in range(size):
            if board[i][j] == ' ':
                board[i][j] = 'O'
                return board
    return board  # This should never be reached if game is properly controlled

