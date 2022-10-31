
boss = []

players = ''


with open('file.txt', 'r') as f:
    index = 0
    for line in f:
        if index == 0:
            boss.append(line.strip())
        else:
            players += line
        index += 1
print(boss)

players_array = []

# Get the players into an array
for line in players.split('\n\n'):
    players_array.append(line.replace('  ',' ').replace(' ', ',').replace('\n', ' ').split(','))
    print(f'{line} \n')

print(players_array[0])

# round = 11
# # Function to up
# def update_player(player):
#     player = player.strip().split(' ')
#     print(f'The player stripper is {player} \n' )
# #    print(f'the player is ${player[0]}')
#     boss_numbers = boss[0].split(',')[:round]
    
#    # print(f'debugging: the values are ${boss_numbers} and \n {player[0] }  {player[1]} {player[2]} {player[3]}  ')
#     #if boss_numbers in  (player[0] and  player[1] and  player[2] and player[3] and player[4]):
#     #    print(f'I got a Row Bingo for player: ${player}')
    
    


# for player in players_array:
#     update_player(player)
#     round += 1
