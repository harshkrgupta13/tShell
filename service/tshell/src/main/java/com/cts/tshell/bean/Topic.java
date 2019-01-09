package com.cts.tshell.bean;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "topic")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")

public class Topic {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "tp_id")
	private int id;

	@Column(name = "tp_name")
	private String name;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "tp_sk_id")
	@JsonView(Views.Internal.class)
	private Skill skill;

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "topic_question", joinColumns = { @JoinColumn(name = "tq_tp_id") }, inverseJoinColumns = {
			@JoinColumn(name = "tq_qu_id") })
	@JsonView(Views.Internal.class)
	private List<Question> questions;

	@Column(name = "tp_percentage")
	private int percentage;

	@Transient
	private float topicScore;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Skill getSkill() {
		return skill;
	}

	public void setSkill(Skill skill) {
		this.skill = skill;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public int getPercentage() {
		return percentage;
	}
	
	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}

	public float getTopicScore() {
		return topicScore;
	}

	public void setTopicScore(float topicScore) {
		this.topicScore = topicScore;
	}

	

}
