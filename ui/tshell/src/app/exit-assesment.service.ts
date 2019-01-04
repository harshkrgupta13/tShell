import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from './environment';

const httpOptions = {
  headers: new HttpHeaders(
    {
      'Content-Type': 'application/json',
    }
  )
};
@Injectable({
  providedIn: 'root'
})
export class ExitAssesmentService {
  allQuestionIdURL = environment.serviceUrlPrefix + '/question/allquestionid/';
  questionUrl = environment.serviceUrlPrefix + '/question/questionId/';
  startAssesmentUrl = environment.serviceUrlPrefix + '/assessment/start';
  saveResponseUrl = environment.serviceUrlPrefix + '/assessment/saveresponse';
  submitAssessmentURL = environment.serviceUrlPrefix + '/assessment/submit';


  constructor(private http: HttpClient) { }

  getQuestionId(id): Observable<any> {
    return this.http.get(this.allQuestionIdURL + id);
  }

  getQuestion(json): Observable<any> {
    return this.http.get(this.questionUrl + json);
  }

  startAssessment(json): Observable<any> {
    return this.http.post(this.startAssesmentUrl, json, httpOptions);
  }

  saveAssessmentResponse(json): Observable<any> {
    return this.http.post(this.saveResponseUrl, json, httpOptions);
  }
  submitAssessment(json): Observable<any> {
    return this.http.post(this.submitAssessmentURL, json, httpOptions);
  }

}
