def new_board(size=3):
    return [[' ' for _ in range(size)] for _ in range(size)]

def print_board(board):
    size = len(board)
    for row in board:
        print('|'.join(row))
        print('-' * (size * 2 - 1))

def is_game_over(board):
    size = len(board)
    # Check rows
    for row in board:
        if row.count(row[0]) == size and row[0] != ' ':
            return True

    # Check columns
    for col in range(size):
        if all(board[row][col] == board[0][col] and board[0][col] != ' ' for row in range(size)):
            return True

    # Check diagonals
    if all(board[i][i] == board[0][0] and board[0][0] != ' ' for i in range(size)):
        return True
    if all(board[i][size-1-i] == board[0][size-1] and board[0][size-1] != ' ' for i in range(size)):
        return True

    # Check for draw
    if all(board[row][col] != ' ' for row in range(size) for col in range(size)):
        return True

    return False

def announce_outcome(board, players_move):
    if is_game_over(board):
        winner = 'Player' if players_move else 'Computer'
        print(f"{winner} wins!")
    else:
        print("It's a draw!")