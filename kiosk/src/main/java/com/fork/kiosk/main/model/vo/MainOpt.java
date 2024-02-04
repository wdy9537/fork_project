package com.fork.kiosk.main.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MainOpt extends Opt{
	List<Opt> optList;
	
}
