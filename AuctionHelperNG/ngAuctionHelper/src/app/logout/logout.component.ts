import { Component, OnInit } from '@angular/core';
import { Router } from '../../../node_modules/@angular/router';
import { AuthenticationService } from '../authentication.service';

@Component({
  selector: 'app-logout',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.css']
})
export class LogoutComponent implements OnInit {
  logout() {
    this.auth.logout();
    this.router.navigateByUrl('login');
  }
  constructor(private auth: AuthenticationService, private router: Router) {}

  ngOnInit() {}
}
