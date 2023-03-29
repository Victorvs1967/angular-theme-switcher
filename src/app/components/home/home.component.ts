import { FormControl } from '@angular/forms';
import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.sass']
})
export class HomeComponent {

  username = new FormControl('');
  submited = false;

  clear() {
    this.username.reset();
    this.submited = false;
  }

  submit() {
    this.submited = true;
  }

}
