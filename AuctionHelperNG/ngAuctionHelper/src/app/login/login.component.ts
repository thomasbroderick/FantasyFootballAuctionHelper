import { Component, OnInit } from '@angular/core';
import { Router } from '../../../node_modules/@angular/router';
import { AuthenticationService } from '../authentication.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  login(form) {
    const user = form.value;
    console.log(user);

    this.auth.login(user.username, user.password).subscribe(
      data => {
        this.router.navigateByUrl('main');
        form.reset();
      },
      err => {
        console.error('Observer got an error: ' + err);
      }
    );

  }
  constructor(private auth: AuthenticationService, private router: Router) {}

  ngOnInit() {}
}
