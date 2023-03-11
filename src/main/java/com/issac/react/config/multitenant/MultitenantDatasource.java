package com.issac.react.config.multitenant;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import com.issac.react.config.AppContextHolder;

/**
 * 
 * @author issac
 *
 */
public class MultitenantDatasource extends AbstractRoutingDataSource {

	@Override
	protected Object determineCurrentLookupKey() {
		return AppContextHolder.getContext().getTenentId();
	}

}
