export class Team {
  id: number;
  name: string;
  owner: string;
  budget: number;

  constructor($name?: string, $owner?: string, $budget?: number) {
    this.name = $name;
    this.owner = $owner;
    this.budget = $budget;
  }
}
