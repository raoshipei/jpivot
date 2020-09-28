/*
 * ====================================================================
 * This software is subject to the terms of the Common Public License
 * Agreement, available at the following URL:
 *   http://www.opensource.org/licenses/cpl.html .
 * Copyright (C) 2003-2004 TONBELLER AG.
 * All Rights Reserved.
 * You must accept the terms of that agreement to use this software.
 * ====================================================================
 *
 * 
 */
package com.tonbeller.jpivot.mondrian;

import com.tonbeller.jpivot.olap.model.Property;
import com.tonbeller.jpivot.olap.model.PropertyHolder;
import com.tonbeller.jpivot.olap.model.impl.PropertyHolderImpl;
import com.tonbeller.jpivot.olap.model.impl.PropertyImpl;
import org.apache.log4j.Logger;

import com.tonbeller.jpivot.olap.model.NumberFormat;
import com.tonbeller.jpivot.olap.model.impl.CellBase;
import com.tonbeller.jpivot.util.NumSeparators;

import java.util.List;

/**
 * Cell Inplementation for Mondrian
 */
public class MondrianCell extends CellBase implements PropertyHolder {

  static Logger logger = Logger.getLogger(MondrianModel.class);

  private mondrian.olap.Cell monCell;
  private MondrianModel model;

  private boolean isGrouping = false;
  private boolean isPercent = false;
  private int fractionDigits = 0;

  private static final Property[] EMPTY = new Property[0];
  Property[] properties;
  /**
   * Constructor
   */
  public MondrianCell() {
    this.properties = EMPTY;
  }

  public MondrianCell(Property[] properties) {
    this.properties = properties;
  }

  public MondrianCell(List propertyList) {
    this.properties = (Property[]) propertyList.toArray(new Property[propertyList.size()]);
  }

  /**
   * Returns the properties.
   * @return Property[]
   */
  public Property[] getProperties() {
    return properties;
  }


  /**
   * Sets the properties.
   * @param properties The properties to set
   */
  public void setProperties(Property[] properties) {
    this.properties = properties;
  }


  /**
   * @see com.tonbeller.jpivot.olap.model.Member#getProperty(String)
   */
  public Property getProperty(String name) {
    for (int i = 0; i < properties.length; i++)
      if (name.equals(properties[i].getName()))
        return properties[i];
    return null;
  }

  /**
   * very slow!
   */
  public void addProperty(PropertyImpl property) {
    int N = properties.length;
    Property[] old = properties;
    properties = new Property[N + 1];
    System.arraycopy(old, 0, properties, 0, N);
    properties[N] = property;
  }

  protected MondrianCell(mondrian.olap.Cell monCell, MondrianModel model) {
    this.monCell = monCell;
    this.model = model;

  }

  /**
   * @see com.tonbeller.jpivot.olap.model.Cell#getValue()
   */
  public Object getValue() {
    return monCell.getValue();
  }

  /**
   * @see com.tonbeller.jpivot.olap.model.Cell#isNull()
   */
  public boolean isNull() {
    return monCell.isNull();
  }

  /* determine formatting properties
   * @see com.tonbeller.jpivot.olap.model.Cell#getFormat()
   */
  public NumberFormat getFormat() {
    if (monCell.isNull())
      return null;

    Object o = monCell.getValue();
    if (o instanceof Number) {
      // continue
    } else
      return null;

    isPercent = formattedValue.indexOf('%') >= 0;
    NumSeparators sep = NumSeparators.instance(model.getLocale());

    fractionDigits = 0;
    if (formattedValue.indexOf(sep.thouSep) >= 0)
      isGrouping = true;
    int i = formattedValue.indexOf(sep.decimalSep);
    if (i > 0) {
      while (++i < formattedValue.length() && Character.isDigit(formattedValue.charAt(i)))
        ++fractionDigits;
    }

    return new NumberFormat() {
      public boolean isGrouping() {
        return isGrouping;
      }

      public int getFractionDigits() {
        return fractionDigits;
      }

      public boolean isPercent() {
        return isPercent;
      }
    };

  }

  /**
   * @return
   */
  public mondrian.olap.Cell getMonCell() {
    return this.monCell;
  }
} // End MondrianCell
