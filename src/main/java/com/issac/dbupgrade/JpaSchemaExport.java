package com.issac.dbupgrade;

import java.util.EnumSet;
import java.util.Set;

import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.hibernate.tool.schema.TargetType;
import org.reflections.Reflections;
import org.reflections.util.ConfigurationBuilder;

import jakarta.persistence.Entity;

public class JpaSchemaExport {

	public static void main(String[] args) {
		JpaSchemaExport j = new JpaSchemaExport();
		j.generateSchema();
	}

	private void generateSchema() {
		var serviceRegistry = new StandardServiceRegistryBuilder()
				.applySetting("hibernate.dialect", "org.hibernate.dialect.PostgreSQL91Dialect").build();
		var entities = scanForEntities("com.issac.react.entity");
		MetadataSources metadataSources = new MetadataSources(serviceRegistry);
		entities.forEach(metadataSources::addAnnotatedClass);
		Metadata metadata = metadataSources.buildMetadata();
		SchemaExport schemaExport = new SchemaExport();
		schemaExport.setFormat(true);
		schemaExport.setOutputFile("out.sql");
		schemaExport.createOnly(EnumSet.of(TargetType.SCRIPT), metadata);
	}

	private Set<Class<?>> scanForEntities(String... packages) {
		var reflections = new Reflections(new ConfigurationBuilder().forPackages(packages));
		return reflections.getTypesAnnotatedWith(Entity.class);
	}
}
