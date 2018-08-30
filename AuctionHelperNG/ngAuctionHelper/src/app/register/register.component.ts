import { AuthenticationService } from './../authentication.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '../../../node_modules/@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  register(form) {
    this.auth.register(form.value).subscribe(
      data => {
        this.router.navigateByUrl('todo');
      },
      err => {
        console.error('Observer got an error: ' + err);
      }
    );

    form.reset();
  }
  constructor(private auth: AuthenticationService, private router: Router) {}

  ngOnInit() {}
}
