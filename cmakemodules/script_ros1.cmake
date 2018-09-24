# Check for the ROS1 libraries
# ==============================

OPTION(DISABLE_ROS "Disable detection/usage of ROS libraries" "OFF")
MARK_AS_ADVANCED(DISABLE_ROS)

SET(CMAKE_MRPT_HAS_ROS 0)
SET(CMAKE_MRPT_HAS_ROS_SYSTEM 0)

IF (NOT DISABLE_ROS)
	# Bare minimum pkg:
	find_package(roscpp QUIET)
	find_package(rosbag QUIET)
	find_package(cv_bridge QUIET)
	find_package(sensor_msgs QUIET)
	find_package(tf2_msgs QUIET)
	find_package(tf2 QUIET)

	if(roscpp_FOUND AND
	   rosbag_FOUND AND
	   cv_bridge_FOUND AND
	   sensor_msgs_FOUND AND
	   tf2_msgs_FOUND AND
	   tf2_FOUND)
		SET(CMAKE_MRPT_HAS_ROS 1)
		SET(CMAKE_MRPT_HAS_ROS_SYSTEM 1)

		# Optional ROS pkgs:
		find_package(std_msgs QUIET)
		find_package(geometry_msgs QUIET)
		find_package(nav_msgs QUIET)

		IF ($ENV{VERBOSE})
			MESSAGE(STATUS "Found ROS1:")
			MESSAGE(STATUS "  roscpp_INCLUDE_DIRS :${roscpp_INCLUDE_DIRS}")
			MESSAGE(STATUS "  roscpp_LIBRARIES    :${roscpp_LIBRARIES}")
		ENDIF()

	ENDIF()
ENDIF()
