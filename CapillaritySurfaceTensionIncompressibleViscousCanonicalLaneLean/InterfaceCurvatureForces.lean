import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure InterfaceCurvatureForcesPackage where
  meanCurvature : ℝ
  surfaceTensionCoefficient : ℝ
  youngLaplacePressureJump : Prop
  curvatureComputedFromGeometry : Prop
  forceBalanceAtInterface : Prop

structure InterfaceCurvatureForcesEvidence (I : InterfaceCurvatureForcesPackage) where
  youngLaplacePressureJumpClosed : I.youngLaplacePressureJump
  curvatureComputedFromGeometryClosed : I.curvatureComputedFromGeometry
  forceBalanceAtInterfaceClosed : I.forceBalanceAtInterface

def InterfaceCurvatureForcesClosed (I : InterfaceCurvatureForcesPackage) : Prop :=
  I.youngLaplacePressureJump ∧ I.curvatureComputedFromGeometry ∧ I.forceBalanceAtInterface

theorem interface_curvature_forces_closed_from_evidence
    (I : InterfaceCurvatureForcesPackage) (E : InterfaceCurvatureForcesEvidence I) :
    InterfaceCurvatureForcesClosed I := by
  exact And.intro E.youngLaplacePressureJumpClosed
    (And.intro E.curvatureComputedFromGeometryClosed E.forceBalanceAtInterfaceClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse
