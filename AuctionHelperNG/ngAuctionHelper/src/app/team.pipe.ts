import { Player } from './models/player';
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'team'
})
export class TeamPipe implements PipeTransform {

  transform(players: Player[], teamID: number): any {
    const results = [];

    players.forEach(function(player) {
      if (player.team.id === teamID) {
        results.push(player);
      }
    });

    return results;
  }

}
