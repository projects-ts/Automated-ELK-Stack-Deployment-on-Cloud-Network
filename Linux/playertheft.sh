#!/bin/bash

cat ExtraNotes3 | awk '{print $1,$2,$3,$10,$11}' |grep '0310_win_loss_player_data:05:00:00 AM' > Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$13,$14}' |grep '0310_win_loss_player_data:08:00:00 AM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$10,$11}' |grep '0310_win_loss_player_data:02:00:00 PM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$4,$5}' |grep '0310_win_loss_player_data:08:00:00 PM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$10,$11}' |grep '0310_win_loss_player_data:11:00:00 PM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$16,$17}' |grep '0312_win_loss_player_data:05:00:00 AM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$10,$11}' |grep '0312_win_loss_player_data:08:00:00 AM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$7,$8}' |grep '0312_win_loss_player_data:02:00:00 PM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$10,$11}' |grep '0312_win_loss_player_data:08:00:00 PM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$13,$14}' |grep '0312_win_loss_player_data:11:00:00 PM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$10,$11}' |grep '0315_win_loss_player_data:05:00:00 AM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$10,$11}' |grep '0315_win_loss_player_data:08:00:00 AM' >> Player_playing_during_losses
cat ExtraNotes3 | awk '{print $1,$2,$3,$4,$5}' |grep '0315_win_loss_player_data:02:00:00 PM' >> Player_playing_during_losses