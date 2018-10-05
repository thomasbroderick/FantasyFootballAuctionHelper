import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { MainComponent } from './main/main.component';
import { LogoutComponent } from './logout/logout.component';
import { RegisterComponent } from './register/register.component';
import { NotfoundComponent } from './notfound/notfound.component';
import { NavigationComponent } from './navigation/navigation.component';
import { PillsComponent } from './pills/pills.component';
import { PositionPipe } from './position.pipe';
import { TeamPipe } from './team.pipe';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    MainComponent,
    LogoutComponent,
    RegisterComponent,
    NotfoundComponent,
    NavigationComponent,
    PillsComponent,
    PositionPipe,
    TeamPipe
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    NgbModule.forRoot(),
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
