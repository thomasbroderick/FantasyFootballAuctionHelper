import { Team } from './team';
export class Player {
  id: number;
  playerName: string;
  team: Team;
  position: string;
  salary: number;
  expectedPoints: number;
  dollarValue: number;

  constructor(
    $playerName?: string,
    $team?: Team,
    $position?: string,
    $salary?: number,
    $expectedPoints?: number,
    $dollarValue?: number
  ) {
    this.playerName = $playerName;
    this.team = $team;
    this.position = $position;
    this.salary = $salary;
    this.expectedPoints = $expectedPoints;
    this.dollarValue = $dollarValue;
  }
}
