from studentA import print_board, is_game_over, new_board
from studentB import ai_move, get_user_move, is_player_starting
from studentA import announce_outcome

if __name__ == '__main__':
    board = new_board(size=3)  # You can change size to 5 for a 5x5 board
    players_move = is_player_starting()
    while not is_game_over(board):
        print_board(board)
        if players_move:
            board = get_user_move(board)
        else:
            board = ai_move(board)
        players_move = not players_move
    print_board(board)
    announce_outcome(board, players_move)
