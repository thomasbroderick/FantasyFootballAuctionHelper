import { Team } from './team';
export class Player {
  id: number;
  name: string;
  team: Team;
  position: string;
  salary: number;
  points: number;

  constructor(
    $name?: string,
    $team?: Team,
    $position?: string,
    $salary?: number,
    $points?: number
  ) {
    this.name = $name;
    this.team = $team;
    this.position = $position;
    this.salary = $salary;
    this.points = $points;
  }
}
