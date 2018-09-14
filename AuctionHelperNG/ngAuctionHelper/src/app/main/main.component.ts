import { TeamService } from './../team.service';
import { PlayerService } from './../player.service';
import { Component, OnInit } from '@angular/core';
import { Player } from '../models/player';
import { Team } from '../models/team';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {
  players: Player[] = [];
  teams: Team[] = [];

  reload() {
    this.playerServ.index().subscribe(
      data => (this.players = data),

      err => console.error('Observer got an error: ' + err)
    );
    this.teamServ.index().subscribe(
      data => (this.teams = data),

      err => console.error('Observer got an error: ' + err)
    );
  }
  constructor(private playerServ: PlayerService, private teamServ: TeamService) { }

  ngOnInit() {
    this.reload();
  }

}
