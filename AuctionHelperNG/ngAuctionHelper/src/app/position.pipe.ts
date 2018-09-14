import { Player } from './models/player';
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'position'
})
export class PositionPipe implements PipeTransform {

  transform(players: Player[], searchType: string): any {
    const results = [];

    if (searchType === 'all') {
      players.forEach(function(player) {
        if (player.team.id === 9) {
          results.push(player);
        }
      });
    } else {
      players.forEach(function(player) {
        if (player.position === searchType && player.team.id === 9) {
          results.push(player);
        }
      });
    }
    return results;
  }

}
