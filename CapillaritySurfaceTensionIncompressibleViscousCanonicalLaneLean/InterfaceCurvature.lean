import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.NavierStokesPDE

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure InterfaceCurvaturePackage where
  interfaceManifold : Type u
  meanCurvature : InterfaceCurvaturePackage → ℝ
  surfaceTension : ℝ
  pressureJump : ℝ
  youngLaplaceEquation : Prop
  curvatureCompatibility : Prop

structure InterfaceCurvatureEvidence (C : InterfaceCurvaturePackage) where
  youngLaplaceEquationClosed : C.youngLaplaceEquation
  curvatureCompatibilityClosed : C.curvatureCompatibility

def InterfaceCurvatureClosed (C : InterfaceCurvaturePackage) : Prop :=
  C.youngLaplaceEquation ∧ C.curvatureCompatibility

theorem interface_curvature_closed_from_evidence (C : InterfaceCurvaturePackage)
    (E : InterfaceCurvatureEvidence C) : InterfaceCurvatureClosed C := by
  exact And.intro E.youngLaplaceEquationClosed E.curvatureCompatibilityClosed

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse