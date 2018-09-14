import { Player } from './models/player';
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'position'
})
export class PositionPipe implements PipeTransform {

  transform(players: Player[], searchType: string): any {
    let results = [];

    if (searchType === 'all') {
      results = players;
    } else {
      players.forEach(function(player) {
        if (player.position === searchType) {
          results.push(player);
        }
      });
    }
    return results;
  }

}
