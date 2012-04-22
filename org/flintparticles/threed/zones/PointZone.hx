/*
* FLINT PARTICLE SYSTEM
* .....................
* 
* Author: Richard Lord
* Copyright (c) Richard Lord 2008-2011
* http://flintparticles.org
* 
* 
* Licence Agreement
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

package org.flintparticles.threeD.zones;

import nme.geom.Vector3D;
import org.flintparticles.threeD.geom.Vector3DUtils;

/**
 * The PointZone zone defines a zone that contains a single point.
 */

class PointZone implements Zone3D 
{
	public var point(pointGetter,pointSetter):Vector3D;
	
	private var _point:Vector3D;
	
	/**
	 * The constructor defines a PointZone zone.
	 * 
	 * @param point The point that is the zone.
	 */
	public function new( point:Vector3D = null )
	{
		this.point = point != null ? point : new Vector3D();
	}
	
	/**
	 * The point that is the zone.
	 */
	private function pointGetter() : Vector3D
	{
		return _point.clone();
	}
	private function pointSetter( value : Vector3D ) : Vector3D
	{
		_point = Vector3DUtils.clonePoint( value );
		return _point;
	}

	/**
	 * The contains method determines whether a point is inside the zone.
	 * This method is used by the initializers and actions that
	 * use the zone. Usually, it need not be called directly by the user.
	 * 
	 * @param x The x coordinate of the location to test for.
	 * @param y The y coordinate of the location to test for.
	 * @return true if point is inside the zone, false if it is outside.
	 */
	public function contains( p:Vector3D ):Bool
	{
		return _point.equals( p );
	}
	
	/**
	 * The getLocation method returns a random point inside the zone.
	 * This method is used by the initializers and actions that
	 * use the zone. Usually, it need not be called directly by the user.
	 * 
	 * @return a random point inside the zone.
	 */
	public function getLocation():Vector3D
	{
		return _point.clone();
	}
	
	/**
	 * The getArea method returns the size of the zone.
	 * This method is used by the MultiZone class. Usually, 
	 * it need not be called directly by the user.
	 * 
	 * @return A value of 1 because the zone contains a single point.
	 */
	public function getVolume():Float
	{
		// treat as one pixel cube
		return 1;
	}
}
