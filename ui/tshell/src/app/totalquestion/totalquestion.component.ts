import { Component, OnInit } from '@angular/core';
import { TotalquestionsService } from '../totalquestions.service';

@Component({
  selector: 'app-totalquestion',
  templateUrl: './totalquestion.component.html',
  styleUrls: ['./totalquestion.component.css']
})
export class TotalquestionComponent implements OnInit {
  userdata:any=[];

  constructor(private totalquestion : TotalquestionsService) { }

  ngOnInit() {
    this.totalquestion.totalquestion(1).subscribe(
      data => { 
              
        for( let i=0;i<data.skills.length;i++){
          let count=0;
          for(let j=0;j<data.skills[i].topics.length;j++){           
            count=count+data.skills[i].topics[j].questions.length;
          }         
          this.userdata[i]={
            skill:{
              name:data.skills[i].name,
              count:count
            }
          };
        }        
       console.log(data);
      }
    );
  }  

}